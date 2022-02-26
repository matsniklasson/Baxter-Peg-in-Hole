; Auto-generated. Do not edit!


(cl:in-package bhand_controller-msg)


;//! \htmlinclude ForceTorque.msg.html

(cl:defclass <ForceTorque> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (force
    :reader force
    :initarg :force
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (torque
    :reader torque
    :initarg :torque
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass ForceTorque (<ForceTorque>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ForceTorque>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ForceTorque)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bhand_controller-msg:<ForceTorque> is deprecated: use bhand_controller-msg:ForceTorque instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ForceTorque>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-msg:header-val is deprecated.  Use bhand_controller-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'force-val :lambda-list '(m))
(cl:defmethod force-val ((m <ForceTorque>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-msg:force-val is deprecated.  Use bhand_controller-msg:force instead.")
  (force m))

(cl:ensure-generic-function 'torque-val :lambda-list '(m))
(cl:defmethod torque-val ((m <ForceTorque>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-msg:torque-val is deprecated.  Use bhand_controller-msg:torque instead.")
  (torque m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ForceTorque>) ostream)
  "Serializes a message object of type '<ForceTorque>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'force) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'torque) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ForceTorque>) istream)
  "Deserializes a message object of type '<ForceTorque>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'force) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'torque) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ForceTorque>)))
  "Returns string type for a message object of type '<ForceTorque>"
  "bhand_controller/ForceTorque")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ForceTorque)))
  "Returns string type for a message object of type 'ForceTorque"
  "bhand_controller/ForceTorque")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ForceTorque>)))
  "Returns md5sum for a message object of type '<ForceTorque>"
  "31103fae9a9f6a2d32c8f5838aa25717")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ForceTorque)))
  "Returns md5sum for a message object of type 'ForceTorque"
  "31103fae9a9f6a2d32c8f5838aa25717")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ForceTorque>)))
  "Returns full string definition for message of type '<ForceTorque>"
  (cl:format cl:nil "Header header~%geometry_msgs/Vector3 force~%geometry_msgs/Vector3 torque~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ForceTorque)))
  "Returns full string definition for message of type 'ForceTorque"
  (cl:format cl:nil "Header header~%geometry_msgs/Vector3 force~%geometry_msgs/Vector3 torque~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ForceTorque>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'force))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'torque))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ForceTorque>))
  "Converts a ROS message object to a list"
  (cl:list 'ForceTorque
    (cl:cons ':header (header msg))
    (cl:cons ':force (force msg))
    (cl:cons ':torque (torque msg))
))
