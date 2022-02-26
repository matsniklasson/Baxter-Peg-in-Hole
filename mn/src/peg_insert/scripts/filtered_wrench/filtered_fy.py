#!/usr/bin/env python
import rospy
from geometry_msgs.msg import (
	WrenchStamped,
)
import numpy as np
import collections

def _wrench_current():
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

def _sensor_filter(element):
    """
    Returns rolling average of previous 20 values from ATI f/t sensor
    @return float: measured value
    @param element: string (fx,fy,fz or tx,ty,tz)
    """
    element = element.lower()
    samples = collections.deque(maxlen=5)
    range_lim = 5
    while not rospy.is_shutdown():
        if element == "fx":
            for i in range(range_lim):
                measured_wrench = _wrench_current()
                fx = measured_wrench[0]
                samples.append(fx)
                n = len(samples)
                total = sum(samples)
                moving_avg = total/n
                # return moving_avg
        elif element == "fy":
            for i in range(range_lim):
                measured_wrench = _wrench_current()
                fy = measured_wrench[1]
                samples.append(fy)
                n = len(samples)
                total = sum(samples)
                moving_avg = total/n
                # return moving_avg
        elif element == "fz":
            for i in range(range_lim):
                measured_wrench = _wrench_current()
                fz = measured_wrench[2]
                samples.append(fz)
                n = len(samples)
                total = sum(samples)
                moving_avg = total/n
                # print("Value: {}\tLength: {}\tMoving avg: {}".format(fz,n,moving_avg))
        elif element == "tx":
            for i in range(range_lim):
                measured_wrench = _wrench_current()
                tx = measured_wrench[3]
                samples.append(tx)
                n = len(samples)
                total = sum(samples)
                moving_avg = total/n
        elif element == "ty":
            for i in range(range_lim):
                measured_wrench = _wrench_current()
                ty = measured_wrench[4]
                samples.append(ty)
                n = len(samples)
                total = sum(samples)
                moving_avg = total/n
        elif element == "tz":
            for i in range(range_lim):
                measured_wrench = _wrench_current()
                tz = measured_wrench[5]
                samples.append(tz)
                n = len(samples)
                total = sum(samples)
                moving_avg = total/n
        else:
            rospy.logerr("Argument is invalid")
        break
    return moving_avg

def filtered_publisher():
    """
    @param element: string
    """
    pub = rospy.Publisher('filtered_ft_fy',WrenchStamped,queue_size=10)
    rospy.init_node('filtered_wrench_fy', anonymous=True)
    rate = rospy.Rate(500)
    
    while not rospy.is_shutdown():
        fy = _sensor_filter("fy")[0]
        msg = WrenchStamped()
        msg.header.stamp = rospy.Time.now()
        msg.wrench.force.y = fy
        rospy.loginfo(msg)
        pub.publish(msg)
        rate.sleep()

def main():
    filtered_publisher()

if __name__ == "__main__":
    try:
        main()
    except rospy.ROSInterruptException:
        pass