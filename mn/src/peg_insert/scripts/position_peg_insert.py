#!/usr/bin/env python

# This file is for the early position control stage of the project.

from baxter_core_msgs.srv import (
    SolvePositionIK,
    SolvePositionIKRequest,
)
from geometry_msgs.msg import (
	PoseStamped,
	Pose,
)
from baxter_core_msgs.msg import EndpointState # Custom message for Baxter, containing Twist data
import rospy
from std_msgs.msg import (
    UInt16,
    Header
)
import baxter_interface
import struct

from baxter_interface import CHECK_VERSION

class PegHoleFinder(object):

	def __init__(self,verbose=True):
		"""
		Class of Baxter that will be used for peg-in-hole insertion
		"""
		self._pub_rate = rospy.Publisher('peg_in_hole',UInt16, queue_size=10)

		self._left_arm = baxter_interface.limb.Limb('left')
		self._right_arm = baxter_interface.limb.Limb('right')
		self._left_joint_names = self._left_arm.joint_names()
		self._right_joint_names = self._right_arm.joint_names()

		# Define which arm is searching for hole
		self._searching_arm = self._right_arm 

		self._verbose = verbose

		# Control parameters
		self._rate = 500.0 # Hz

		print("Retrieving Baxter's state... ")
		self._rs = baxter_interface.RobotEnable(CHECK_VERSION)
		self._init_state = self._rs.state().enabled
		print("Enabling Baxter... ")
		self._rs.enable()

		# Joint state publishing rate
		self._pub_rate.publish(self._rate)

	def _reset_control_modes(self):
		rate = rospy.Rate(self._rate)
		for _ in xrange(100):
			if rospy.is_shutdown():
				return False
			self._left_arm.exit_control_mode()
			self._right_arm.exit_control_mode()
			self._pub_rate.publish(100)  # 100Hz default joint state rate
			rate.sleep()
		return True

	def _ik_request(self,limb,pose):
		"""
		Return: IK joint angle solutions for a given pose, as list
		Argument: Limb, as a string. Pose, as defined by RR SDK/Wiki
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

	def clean_shutdown(self):
		print("\nShutting down...")
		self._reset_control_modes()
		self.starter_pose_cleaned(move=1)
		if not self._init_state:
			print("Disabling robot...")
			self._rs.disable()
		return True

	def starter_pose_cleaned(self,move=0):
		"""
		Cleaned version of starter_pose()
		Argument: move as int (default = 0); if move == 1 then moves to starting pose; otherwise returns starting pose
		Return: Starting pose of right arm as Pose msg (if move argument != 0)
		"""
		print("Setting starting pose... ")
		left_pose_joints = {
			'left_s0': 1.4940875715094766, 
			'left_s1': -0.8665984200710999,
			'left_e0': -0.17477971941118162, 
			'left_e1': 2.4601444081131674, 
			'left_w0': 2.880115819031508,
			'left_w1': 0.09680025515350535, 
			'left_w2': -0.7659527410089084}
		right_pose = Pose()
		# right_pose.position.x = 0.778793364039
		# right_pose.position.y = -0.166984956353 #- 0.3
		# right_pose.position.z = 0.0308997854693 + 0.15
		# right_pose.orientation.x = 0.0644610699672
		# right_pose.orientation.y = 0.705464352641
		# right_pose.orientation.z = 0.694462608033
		# right_pose.orientation.w = 0.126041674277

		right_pose.position.x = 0.550141344112
		right_pose.position.y = -0.131004171505
		right_pose.position.z = 0.191433346055
		right_pose.orientation.x = -0.0143242825434
		right_pose.orientation.y = 0.708624091862
		right_pose.orientation.z = 0.703582697541
		right_pose.orientation.w = 0.0511673634651

		if move == 0:
			return right_pose
		elif move == 1:
			# self._left_arm.move_to_joint_positions(left_pose_joints)
			self.move_to('right',right_pose)
		else:
			print('Starter pose argument must be 1 or 0 (default)')

	def current_pose(self,limb):
		"""
		Return: Endpoint pose, as created by Rethink Robotics code
		Argument: Limb, as formated by Rethink Robotics (not str) ie baxter_interface.limb.Limb('<side>')
		"""
		return limb.endpoint_pose()

	def move_joints(self,limb,joint_angles):
		"""
		Action: Moves limb to given joint angles
		Return: Nothing
		Argument: Limb, as a string. Joint angles, as a list
		"""
		if limb == 'left' and joint_angles:
			self._left_arm.move_to_joint_positions(joint_angles)
		elif limb == 'right' and joint_angles:
			self._right_arm.move_to_joint_positions(joint_angles)
		else:
			rospy.logerr("No Joint Angles provided for move_to_joint_positions. Staying put.")

	def move_to(self,limb,pose):
		"""
		Action: Moves limb to a given pose in Cartesian space
		Return: Nothing
		Argument: Limb as a string. Pose, as defined by RR SDK/Wiki
		"""
		if limb == 'left':
			left_joint_angles = self._ik_request('left',pose)
			self.move_joints('left',left_joint_angles)
		elif limb == 'right':
			right_joint_angles = self._ik_request('right',pose)
			self.move_joints('right',right_joint_angles)
		else:
			print("Argument expected for move_to() ('left' or 'right'")

	def search(self,limb):
		"""
		Searching for hole - only uses position control.
		Argument: Limb, as string
		"""
		rate = rospy.Rate(self._rate)

		self.s_arm = limb.lower() # searching arm for this function
		# Below line is my orginal code
		#starting_pose = self.current_pose(self._searching_arm)
		# Below is testing code, trying to stop arm from dropping
		
		starting_pose = Pose() # Starting pose, same as pose defined in starter_pose_cleaned()
		starting_pose = self.starter_pose_cleaned(move=0)

		current_pose = self.current_pose(self._searching_arm)
		new_pose = Pose()
		# y_lim = current_pose['position'].y + 0.08
		counter = 0
		
		while not rospy.is_shutdown():
			while counter < 10:
				new_pose.position.x = starting_pose.position.x
				new_pose.position.y = current_pose['position'].y + 0.01
				new_pose.position.z = starting_pose.position.z
				new_pose.orientation.x = starting_pose.orientation.x
				new_pose.orientation.y = starting_pose.orientation.y
				new_pose.orientation.z = starting_pose.orientation.z
				new_pose.orientation.w = starting_pose.orientation.w
				self.move_to(self.s_arm,new_pose)
				current_pose = self.current_pose(self._searching_arm)
				counter += 1
				rate.sleep()
				if rospy.is_shutdown():
					break
			print('Search complete')
			break

def main():
	"""
	Peg-in-hole finder
	"""
	print("Starting node... ")
	rospy.init_node("peg_hole_finder")

	finder = PegHoleFinder()
	rospy.on_shutdown(finder.clean_shutdown)

	finder.starter_pose_cleaned(move=1)

	finder.search('right')

if __name__ == "__main__":
	main()
