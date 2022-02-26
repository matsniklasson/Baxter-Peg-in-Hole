; Auto-generated. Do not edit!


(cl:in-package bhand_controller-msg)


;//! \htmlinclude Service.msg.html

(cl:defclass <Service> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Service (<Service>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Service>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Service)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bhand_controller-msg:<Service> is deprecated: use bhand_controller-msg:Service instead.")))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Service>)))
    "Constants for message type '<Service>"
  '((:INIT_HAND . 1)
    (:CLOSE_GRASP . 2)
    (:OPEN_GRASP . 3)
    (:SET_GRASP_1 . 4)
    (:SET_GRASP_2 . 5)
    (:CLOSE_HALF_GRASP . 6)
    (:TARE_FTS . 7))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Service)))
    "Constants for message type 'Service"
  '((:INIT_HAND . 1)
    (:CLOSE_GRASP . 2)
    (:OPEN_GRASP . 3)
    (:SET_GRASP_1 . 4)
    (:SET_GRASP_2 . 5)
    (:CLOSE_HALF_GRASP . 6)
    (:TARE_FTS . 7))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Service>) ostream)
  "Serializes a message object of type '<Service>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Service>) istream)
  "Deserializes a message object of type '<Service>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Service>)))
  "Returns string type for a message object of type '<Service>"
  "bhand_controller/Service")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Service)))
  "Returns string type for a message object of type 'Service"
  "bhand_controller/Service")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Service>)))
  "Returns md5sum for a message object of type '<Service>"
  "c09093085862e16e122942cf27b990b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Service)))
  "Returns md5sum for a message object of type 'Service"
  "c09093085862e16e122942cf27b990b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Service>)))
  "Returns full string definition for message of type '<Service>"
  (cl:format cl:nil "# constants~%int32 INIT_HAND = 1~%int32 CLOSE_GRASP = 2~%int32 OPEN_GRASP = 3~%int32 SET_GRASP_1 = 4~%int32 SET_GRASP_2 = 5~%int32 CLOSE_HALF_GRASP = 6~%int32 TARE_FTS = 7~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Service)))
  "Returns full string definition for message of type 'Service"
  (cl:format cl:nil "# constants~%int32 INIT_HAND = 1~%int32 CLOSE_GRASP = 2~%int32 OPEN_GRASP = 3~%int32 SET_GRASP_1 = 4~%int32 SET_GRASP_2 = 5~%int32 CLOSE_HALF_GRASP = 6~%int32 TARE_FTS = 7~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Service>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Service>))
  "Converts a ROS message object to a list"
  (cl:list 'Service
))
