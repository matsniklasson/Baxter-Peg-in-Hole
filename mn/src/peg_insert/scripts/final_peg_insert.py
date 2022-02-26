#!/usr/bin/env python

from baxter_core_msgs.srv import (
    SolvePositionIK,
    SolvePositionIKRequest,
)
from geometry_msgs.msg import (
	PoseStamped,
	Pose,
	Point,
	Quaternion,
	Wrench,
	WrenchStamped,
	Twist,
	TwistStamped,
)
from baxter_core_msgs.msg import EndpointState # Custom message for Baxter, containing Twist data
import rospy
import numpy as np
from std_msgs.msg import (
    UInt16,
    String,
    Header
)
import baxter_control
import baxter_interface
from baxter_interface import CHECK_VERSION
import baxter_pykdl
import struct
import numpy as np
import collections

class PiHFinder(object):
    def __init__(self,verbose=True,search_arm="right"):
        """
        Class of Baxter robot to be used for Peg-in-Hole (PiH) task
        """
        self._pub_rate = rospy.Publisher('pih_finder',UInt16, queue_size=10)

        self._left_arm = baxter_interface.limb.Limb('left')
        self._right_arm = baxter_interface.limb.Limb('right')
        self._left_joint_names = self._left_arm.joint_names()
        self._right_joint_names = self._right_arm.joint_names()

        search_arm = search_arm.lower()
        if search_arm == "right":
            self._searching_arm = self._right_arm
        elif search_arm == "left":
            self._searching_arm = self._left_arm
        elif search_arm != "r" or search_arm != "l":
            print("Specify the searching arm with 'left' or 'right'")
        

        # KDL objects for use with PyKDL
        self._kdl_left = baxter_pykdl.baxter_kinematics("left")
        self._kdl_right = baxter_pykdl.baxter_kinematics("right")
        
        self._verbose = verbose

        self._rate = 300.0 # Hz

        print("Retrieving Baxter's state... ")
        self._rs = baxter_interface.RobotEnable(CHECK_VERSION)
        self._init_state = self._rs.state().enabled
        print("Enabling Baxter... ")
        self._rs.enable()

        # Joint state publishing rate
        self._pub_rate.publish(self._rate)

    def _ik_request(self,limb,pose):
        """
        Returns joint angle solutions for a given pose
        @return: List of IK joint angle solutions for a given pose
        @param limb: string 
        @param pose: Pose, as defined by RR SDK/Wiki
        """
        ns = "ExternalTools/" + limb + "/PositionKinematicsNode/IKService"
        iksvc = rospy.ServiceProxy(ns, SolvePositionIK)
        hdr = Header(stamp=rospy.Time.now(), frame_id='base')
        ikreq = SolvePositionIKRequest()
        ikreq.pose_stamp.append(PoseStamped(header=hdr, pose=pose))
        try:
            rospy.wait_for_service(ns,5.0)
            resp = iksvc(ikreq)
        except (rospy.ServiceException, rospy.ROSException) as e:
            rospy.logerr("Service call failed: %s" % (e,))
            return False
		
        # Check if result valid, and type of seed ultimately used to get solution
        # convert rospy's string representation of uint8[]'s to int's
        resp_seeds = struct.unpack('<%dB' % len(resp.result_type), resp.result_type)
        if resp_seeds[0] != resp.RESULT_INVALID:
            seed_str = {
                        ikreq.SEED_USER: 'User Provided Seed',
                        ikreq.SEED_CURRENT: 'Current Joint Angles',
                        ikreq.SEED_NS_MAP: 'Nullspace Setpoints',
                        }.get(resp_seeds[0], 'None')
            if self._verbose:
                print("IK Solution SUCCESS - Valid Joint Solution Found from Seed Type: {0}".format(seed_str))
            # Format solution into Limb API-compatible dictionary
            limb_joints = dict(zip(resp.joints[0].name, resp.joints[0].position))
            if self._verbose:
                #print("IK Joint Solution:\n{0}".format(limb_joints))
                print("------------------")
        else:
            rospy.logerr("INVALID POSE - No Valid Joint Solution Found.")
            return False
        return limb_joints
    
    def _clean_shutdown(self):
        print("\nShutting down...")
        self.init_pose()
        if not self._init_state:
            print("Disabling robot...")
            self._rs.disable()
        return True
    
    def _move_to(self,limb,pose):
        """
        Moves end effector based off inverse position kinematics (IPK) joint angle solutions
        @param limb: string
        @param pose: Pose, as defined by RR SDK
        """
        limb = limb.lower()
        if limb == "left":
            left_joint_angles = self._ik_request(limb,pose)
            self._left_arm.move_to_joint_positions(left_joint_angles)
        elif limb == "right":
            right_joint_angles = self._ik_request(limb,pose)
            self._right_arm.move_to_joint_positions(right_joint_angles)
        elif limb != "left" or limb != "right":
            rospy.logerr("Limb must be specified as 'left' or 'right'")
    
    def _set_q_dot(self,limb,q_dot):
        """
        Set joint velocities
        @param limb: string
        @param q_dot: list of joint velocities
        """
        limb = limb.lower()
        if limb == "left":
            jnt_names = self._left_joint_names
            jnt_vels = dict(zip(jnt_names,q_dot))  # Creates baxter_interface friendly format
            self._left_arm.set_joint_velocities(jnt_vels)
        elif limb == "right":
            jnt_names = self._right_joint_names
            jnt_vels = dict(zip(jnt_names,q_dot))
            self._right_arm.set_joint_velocities(jnt_vels)
        else:
            rospy.logerr("Limb must be specified as 'left' or 'right'")
    
    def init_pose(self):
        """
        Moves Baxter's arms to starting poses
        """
        left_pose = Pose()
        left_pose.position.x = -0.114
        left_pose.position.y = 0.598
        left_pose.position.z = -0.156
        left_pose.orientation.x = -0.058
        left_pose.orientation.y = 0.996
        left_pose.orientation.z = 0.012
        left_pose.orientation.w = 0.063

        right_pose = Pose()
        right_pose.position.x = 0.550141344112 # for PiH
        # right_pose.position.x = 0.650141344112 # for hybrid/velocity control section
        right_pose.position.y = -0.131004171505
        right_pose.position.z = 0.191433346055
        right_pose.orientation.x = -0.0143242825434
        right_pose.orientation.y = 0.708624091862
        right_pose.orientation.z = 0.703582697541
        right_pose.orientation.w = 0.0511673634651

        self._move_to("left",left_pose)
        self._move_to("right",right_pose)
    
    def _pose_twist_blank(self):
        """
        Initialise a 3x1 numpy array to zeroes
        @return: numpy array (3,1)
        """
        return np.zeros((3,1))
    
    def _pose_current(self,limb):
        """
        Current pose as 3x1 numpy array. Only position component, i.e. X_v
        @return: numpy array (3,1)
        @param limb: string
        """
        # msg = rospy.wait_for_message('/robot/limb/'+limb+'/endpoint_state', EndpointState, timeout=0.2)
        msg = rospy.wait_for_message('/robot/limb/'+limb+'/endpoint_state', EndpointState)

        x = msg.pose.position.x
        y = msg.pose.position.y
        z = msg.pose.position.z
        bax_pose = np.array([[x,y,z]]).T

        return bax_pose
    
    def _twist_current(self,limb):
        """
        Curent twist as 3x1 numpy array. Only linear component, i.e. X_dot_v
        @return: numpy array (3,1)/robot/limb/right/endpoint_state
        @param limb: string
        """
        msg = rospy.wait_for_message('/robot/limb/'+limb+'/endpoint_state', EndpointState, timeout=0.2)

        x = msg.twist.linear.x
        y = msg.twist.linear.y
        z = msg.twist.linear.z
        bax_twist = np.array([[x,y,z]]).T

        return bax_twist

    def _wrench_current(self):
        """
        Current wrench values from ATI force-torque sensor. '/transformed_world' is the biased topic
        @return: numpy array (6x1)
        """
        while not rospy.is_shutdown():
            # msg = rospy.wait_for_message("/transformed_world", WrenchStamped, timeout=0.2)
            msg = rospy.wait_for_message("/transformed_world", WrenchStamped)
            fx = msg.wrench.force.x
            fy = msg.wrench.force.y
            fz = msg.wrench.force.z
            tx = msg.wrench.torque.x
            ty = msg.wrench.torque.y
            tz = msg.wrench.torque.z
            bax_wrench = np.array([[fx,fy,fz,tx,ty,tz]]).T
            break
        
        return bax_wrench

    def _pose_twist_adj(self,x_start,element,increment):
        """
        Adjusts x_start and returns a copy of it
        @return: numpy array (3,1)
        @param x_start: numpy array (3,1) of current pose position
        @param element: string (x, y or z). Element of x_start to adjust
        @param increment: float. Amount to adjust element by
        """
        x_goal = np.copy(x_start)
        element = element.lower()
        if x_goal.size != 3:
            rospy.logerr("Check x_start size and shape")
            return
        elif element == "x":
            x_goal[0] = x_start[0] + increment
        elif element == "y":
            x_goal[1] = x_start[1] + increment
        elif element == "z":
            x_goal[2] = x_start[2] + increment
        else:
            rospy.logerr("Check arguments")
        return x_goal
       
    def _twist_pid(self,pose_in,twist_in,element,pose_increment,twist_increment):
        """
        Calculate twist with PID controller, only linear velocities, i.e. X_dot_v
        @return: numpy array (3,1)
        @param pose_in: numpy array (3,1)
        @param twist_in: numpy array (3,1)
        @param element: string (x, y or z). Element of pose/twist to adjust
        @param pose_increment: float. Amount to adjust pose element by
        @param twist_increment: float. Amount to adjust twist element by
        """
        kp = 5
        ki = 0.1
        kd = 1

        bax_pid = baxter_control.pid.PID() # Create Baxter PID object
        bax_pid.set_kp(0)
        bax_pid.set_ki(ki)
        bax_pid.set_kd(0)

        pose_goal = self._pose_twist_adj(pose_in,element,pose_increment)
        pose_error = pose_goal - pose_in

        twist_goal = self._pose_twist_adj(twist_in,element,twist_increment)
        twist_error = twist_goal - twist_in

        p_comp = kp*pose_error
        i_comp = bax_pid.compute_output(pose_error)
        d_comp = kd*twist_error

        twist_out = p_comp + i_comp + d_comp
        return twist_out
    
    def _ivk(self,twist):
        """
        Calculates joint velocities for a given twist
        @return: numpy array (7,1)
        @param twist: numpy array (3,1). Linear velocities i.e. X_dot_v
        """
        pinv_J = self._kdl_right.jacobian_pseudo_inverse()
        pinv_Jv = np.array(pinv_J[0:,0:3])
        joint_vels = np.dot(pinv_Jv,twist)
        return joint_vels
    
    def _sensor_filter(self,element):
        """
        Returns rolling average of previous 20 values from ATI f/t sensor
        @return float: measured value
        @param element: string (fx,fy,fz or tx,ty,tz)
        """
        element = element.lower()
        samples = collections.deque(maxlen=10)
        range_lim = 10
        while not rospy.is_shutdown():
            if element == "fx":
                for i in range(range_lim):
                    measured_wrench = self._wrench_current()
                    fx = measured_wrench[0]
                    samples.append(fx)
                    n = len(samples)
                    total = sum(samples)
                    moving_avg = total/n
                    # return moving_avg
            elif element == "fy":
                for i in range(range_lim):
                    measured_wrench = self._wrench_current()
                    fy = measured_wrench[1]
                    samples.append(fy)
                    n = len(samples)
                    total = sum(samples)
                    moving_avg = total/n
                    # return moving_avg
            elif element == "fz":
                for i in range(range_lim):
                    measured_wrench = self._wrench_current()
                    fz = measured_wrench[2]
                    samples.append(fz)
                    n = len(samples)
                    total = sum(samples)
                    moving_avg = total/n
                    # print("Value: {}\tLength: {}\tMoving avg: {}".format(fz,n,moving_avg))
            elif element == "tx":
                for i in range(range_lim):
                    measured_wrench = self._wrench_current()
                    tx = measured_wrench[3]
                    samples.append(tx)
                    n = len(samples)
                    total = sum(samples)
                    moving_avg = total/n
            elif element == "ty":
                for i in range(range_lim):
                    measured_wrench = self._wrench_current()
                    ty = measured_wrench[4]
                    samples.append(ty)
                    n = len(samples)
                    total = sum(samples)
                    moving_avg = total/n
            elif element == "tz":
                for i in range(range_lim):
                    measured_wrench = self._wrench_current()
                    tz = measured_wrench[5]
                    samples.append(tz)
                    n = len(samples)
                    total = sum(samples)
                    moving_avg = total/n
            else:
                rospy.logerr("Argument is invalid")
            break
        return moving_avg

    def _monitor_fz(self):
        """
        Monitor fz to see if whole is found
        @return bool: True if in hole, false if not
        """
        lim = 1.2
        fz = self._sensor_filter("fz")[0]
        print("Normal force: {}".format(fz))
        if fz < lim:
            rospy.loginfo("Drop in normal force, moving down")
            return True
        else:
            return False
    
    def lower_ee(self,limb):
        """
        Lowers the end effector until z-force threshold is met
        @param limb: string
        """
        rate = rospy.Rate(self._rate)

        pose_starting = self._pose_current(limb)
        pose_current = pose_starting

        twist_zero = self._pose_twist_blank()

        fz_lim = 3.0 # N
        fz = self._sensor_filter("fz")

        rospy.loginfo("Lowering end effector...")

        while not rospy.is_shutdown():
            while fz < fz_lim:
                if rospy.is_shutdown():
                    break
                x_dot = self._twist_pid(pose_current,twist_zero,"z",-0.002,-0.001)
                q_dot = self._ivk(x_dot)
                self._set_q_dot(limb,q_dot)
                pose_current = self._pose_current(limb)
                fz = self._sensor_filter("fz")

                rate.sleep()
            break

        rospy.loginfo("End effector lowered.")

    def line(self,limb):
        """
        Moves end effector in a straight line, showing functionality of this class.
        """
        rate = rospy.Rate(self._rate)

        # Initialise pose here
        pose_starting = self._pose_current(limb)
        pose_current = pose_starting

        # Initialise twist here
        twist_zero = self._pose_twist_blank()

        # Limits
        y_lim = pose_current[1] + 0.1

        cnt = 0

        while not rospy.is_shutdown():
            while pose_current[1] < y_lim:
                if rospy.is_shutdown():
                    break
                    
                x_dot = self._twist_pid(pose_current,twist_zero,"y",0.008,0.005)
                q_dot = self._ivk(x_dot)
                self._set_q_dot(limb,q_dot)
                pose_current = self._pose_current(limb)

                rate.sleep()
            while cnt < 10000:
                x_zero = self._twist_pid(pose_current,twist_zero,"y",0,0)
                q_zero = self._ivk(x_zero)
                self._set_q_dot(limb,q_zero)
                pose_current = self._pose_current(limb)
                cnt += 1
            break
        rospy.loginfo("Line complete")

    def hybrid_vel_force(self,limb):
        """
        Moves end effector down until normal force threshold is met. Then moves in a line.
        """
        self.lower_ee(limb)
        self.line(limb)


    def search(self,limb):
        """
        Performs main PiH search
        """
        rate = rospy.Rate(self._rate)

        # Initialise pose
        pose_current = self._pose_current(limb)
        pose_start = np.copy(pose_current)

        # Initialise twist
        twist_zero = self._pose_twist_blank()

        # Initialise wrench here
        starting_wrench = [0 for _ in xrange(6)]
        measured_wrench = self._wrench_current()

        # Limits
        x_lim_pos = pose_current[0] + 0.025 # Upper grid limit
        y_lim_pos = pose_current[1] + 0.005 # Left grid limit
        y_lim_neg = pose_current[1] - 0.005 # Right grid limit
        tx_lim_pos = -0.05 # Torque limit in x direction
        tx_lim_neg = -0.3
        ty_lim_pos = 0.1
        ty_lim_neg = 0.25
        fz_lim = 5 # Force limit when testing if peg is in hole
        counter_lim = 1700 # for moving peg off edge hole
        hole_depth = 0.02
        
        # Increments for moving
        x_increment = 0.005
        z_increment = 0.15
        z_increment_pose = 0.005
        increment_pose = 0.001
        increment_pose_larger = 0.008 # Affects PID and moves faster, for when peg is in hole
        increment_twist = 0.0001

        # Moving states - for search
        moving_pos_y = True # Moving left (Baxter POV), start in this dir'n
        moving_neg_y = False # Moving right (Baxter POV)
        moving_pos_x = False # Moving away (Baxter POV)
        moving_pos_z = False # Moving up (Baxter POV)
        
        # Inserting states - for confirming if peg is in hole
        gap_found = False # If z force drops -> triggers insert states
        test_in_hole = False # Testing if in hole after gap_found is triggered
        test_ty_pos = False # Testing if in hole with ty, substate of test_found
        test_ty_neg = False
        test_tx_pos = False # Testing if in hole with tx, substate of test_found
        test_tx_neg = False

        search_success = False # Final search fail or success bool

        rospy.loginfo("Moving right...")

        while not rospy.is_shutdown():
            while moving_pos_y:
                if rospy.is_shutdown():
                    break
                x_dot = self._twist_pid(pose_current,twist_zero,"y",increment_pose,increment_twist)
                q_dot = self._ivk(x_dot)
                self._set_q_dot(limb,q_dot)
                gap_found = self._monitor_fz()
                pose_current = self._pose_current(limb)
                if gap_found:
                    z_last = pose_current[2]
                    gap_found = False
                    moving_pos_y = False
                    test_in_hole = True
                    rospy.loginfo("Testing if peg is in hole...")
                    break
                if pose_current[1] >= y_lim_pos:
                    x_last = pose_current[0] # x when leaves this state
                    y_last = pose_current[1] # y when leaves this state
                    moving_pos_y = False
                    moving_pos_x = True
                    rospy.loginfo("Moving forward...")
                    break

            while moving_pos_x:
                if rospy.is_shutdown():
                    break
                x_dot = self._twist_pid(pose_current,twist_zero,"x",increment_pose,increment_twist)
                q_dot = self._ivk(x_dot)
                self._set_q_dot(limb,q_dot)
                gap_found = self._monitor_fz()
                pose_current = self._pose_current(limb)
                if gap_found:
                    z_last = pose_current[2]
                    gap_found = False
                    moving_pos_x = False
                    test_in_hole = True
                    rospy.loginfo("Testing if peg is in hole...")
                    break
                if pose_current[0] >= x_last + x_increment:
                    x_last = pose_current[0] # x when leaves this state
                    y_last = pose_current[1] # y when leaves this state
                    moving_pos_x = False
                    if x_last >= x_lim_pos:
                        moving_pos_z = True
                        rospy.loginfo("Limit reached, moving up...")
                    elif y_last >= y_lim_pos - 0.01:
                        moving_neg_y = True
                        rospy.loginfo("Moving left...")
                    elif y_last <= y_lim_neg + 0.01:
                        moving_pos_y = True
                        rospy.loginfo("Moving right...")
                    break

            while moving_neg_y:
                if rospy.is_shutdown():
                    break
                x_dot = self._twist_pid(pose_current,twist_zero,"y",-increment_pose,-increment_twist)
                q_dot = self._ivk(x_dot)
                self._set_q_dot(limb,q_dot)
                pose_current = self._pose_current(limb)
                gap_found = self._monitor_fz()
                if gap_found:
                    z_last = pose_current[2]
                    gap_found = False
                    moving_neg_y = False
                    test_in_hole = True
                    rospy.loginfo("Testing if peg is in hole...")
                    break
                if pose_current[1] <= y_lim_neg:
                    x_last = pose_current[0] # x when leaves this state
                    y_last = pose_current[1] # y when leaves this state
                    moving_neg_y = False
                    moving_pos_x = True
                    rospy.loginfo("Moving forward...")
                    break

            while moving_pos_z:
                if rospy.is_shutdown():
                    break
                pose_current = self._pose_current(limb)
                x_dot = self._twist_pid(pose_current,twist_zero,"z",z_increment_pose,increment_twist)
                q_dot = self._ivk(x_dot)
                self._set_q_dot(limb,q_dot)
                pose_current = self._pose_current(limb)
                if pose_current[2] >= pose_start[2] + z_increment:
                    moving_pos_z = False

            while test_in_hole:
                if rospy.is_shutdown():
                    break
                x_dot = self._twist_pid(pose_current,twist_zero,"z",-increment_pose,-increment_twist)
                q_dot = self._ivk(x_dot)
                self._set_q_dot(limb,q_dot)
                pose_current = self._pose_current(limb)
                fz = self._sensor_filter("fz")
                print("fz: {}".format(fz))
                if pose_current[2] < z_last - hole_depth:
                    # Hole not found
                    test_in_hole = False
                    break
                elif fz > fz_lim:
                    rospy.loginfo("fz limit reached, testing ty positive...")
                    x_last = pose_current[0]
                    y_last = pose_current[1]
                    test_ty_pos = True
                while test_ty_pos:
                    x_dot = self._twist_pid(pose_current,twist_zero,"y",increment_pose,increment_twist)
                    q_dot = self._ivk(x_dot)
                    self._set_q_dot(limb,q_dot)
                    pose_current = self._pose_current(limb)
                    ty = self._sensor_filter("ty")
                    print("ty: {}".format(ty))
                    if pose_current[1] > y_last + 0.03:
                        # Hole not found
                        test_ty_pos = False
                        test_in_hole = False
                        break
                    elif ty < ty_lim_pos:
                        rospy.loginfo("ty positive limit reached, testing ty negative...")
                        count = 0
                        while count < counter_lim:
                            # move peg off edge
                            x_dot = self._twist_pid(pose_current,twist_zero,"y",-increment_pose_larger,-increment_twist)
                            q_dot = self._ivk(x_dot)
                            self._set_q_dot(limb,q_dot)
                            count += 1
                        x_last = pose_current[0]
                        y_last = pose_current[1]
                        test_ty_pos = False
                        test_ty_neg = True
                while test_ty_neg:
                    x_dot = self._twist_pid(pose_current,twist_zero,"y",-increment_pose,-increment_twist)
                    q_dot = self._ivk(x_dot)
                    self._set_q_dot(limb,q_dot)
                    pose_current = self._pose_current(limb)
                    ty = 0
                    ty = self._sensor_filter("ty")
                    print("ty: {}".format(ty))
                    if pose_current[1] < y_last - 0.03:
                        # Hole not found
                        test_ty_pos = False
                        test_in_hole = False
                        break
                    elif ty > ty_lim_neg:
                        rospy.loginfo("ty negative limit reached, testing tx positive...")
                        count = 0
                        while count < counter_lim:
                            # move peg off edge
                            x_dot = self._twist_pid(pose_current,twist_zero,"y",increment_pose_larger,increment_twist)
                            q_dot = self._ivk(x_dot)
                            self._set_q_dot(limb,q_dot)
                            count += 1
                        x_last = pose_current[0]
                        test_ty_neg = False
                        test_tx_pos = True
                while test_tx_pos:
                    x_dot = self._twist_pid(pose_current,twist_zero,"x",increment_pose,increment_twist)
                    q_dot = self._ivk(x_dot)
                    self._set_q_dot(limb,q_dot)
                    pose_current = self._pose_current(limb)
                    tx = self._sensor_filter("tx")
                    print("tx: {}".format(tx))
                    if pose_current[0] > x_last + 0.03:
                        test_tx_pos = False
                        test_in_hole = False
                        break
                    elif tx > tx_lim_pos:
                        rospy.loginfo("tx positive limit reached, tesing tx negative...")
                        count = 0
                        while count < counter_lim:
                            # move peg off edge
                            x_dot = self._twist_pid(pose_current,twist_zero,"x",-increment_pose_larger,-increment_twist)
                            q_dot = self._ivk(x_dot)
                            self._set_q_dot(limb,q_dot)
                            count += 1
                        test_tx_pos = False
                        test_tx_neg = True
                while test_tx_neg:
                    x_dot = self._twist_pid(pose_current,twist_zero,"x",-increment_pose,-increment_twist)
                    q_dot = self._ivk(x_dot)
                    self._set_q_dot(limb,q_dot)
                    pose_current = self._pose_current(limb)
                    tx = 0
                    tx = self._sensor_filter("tx")
                    print("tx: {}".format(tx))
                    if pose_current[0] < x_last - 0.03:
                        test_tx_neg = False
                        test_in_hole = False
                        break
                    elif tx < tx_lim_neg:
                        rospy.loginfo("tx limit reached")
                        count = 0
                        while count < counter_lim:
                            # move peg off edge
                            x_dot = self._twist_pid(pose_current,twist_zero,"x",increment_pose_larger,increment_twist)
                            q_dot = self._ivk(x_dot)
                            self._set_q_dot(limb,q_dot)
                            count += 1
                        test_tx_neg = False
                        test_in_hole = False
                        search_success = True
                        moving_pos_z = True
                        rospy.loginfo("Removing peg from hole...")

            if not moving_pos_y and not moving_neg_y and not moving_pos_x and not moving_pos_z:
                break
            rate.sleep()

        if search_success:
            rospy.loginfo("Search successfully completed.")
        else:
            rospy.loginfo("Search failed, try again by moving Baxter's end effector above hole")

def main():
    rospy.init_node("final_peg_insert")
    
    pih = PiHFinder(verbose=False,search_arm="right")
    rospy.on_shutdown(pih._clean_shutdown)

    # Searching limb as string
    limb = "right"

    pih.init_pose()
    
    pih.lower_ee(limb)
    # pih.line(limb)
    # pih.hybrid_vel_force(limb)

    pih.search(limb)

    # rosbag record /robot/limb/right/endpoint_state /transformed_world /filtered_ft_fx /filtered_ft_fy /filtered_ft_fz /filtered_ft_tx /filtered_ft_ty /filtered_ft_tz

if __name__ == "__main__":
    main()