; Auto-generated. Do not edit!


(cl:in-package bhand_controller-srv)


;//! \htmlinclude Actions-request.msg.html

(cl:defclass <Actions-request> (roslisp-msg-protocol:ros-message)
  ((action
    :reader action
    :initarg :action
    :type cl:integer
    :initform 0))
)

(cl:defclass Actions-request (<Actions-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Actions-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Actions-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bhand_controller-srv:<Actions-request> is deprecated: use bhand_controller-srv:Actions-request instead.")))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <Actions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-srv:action-val is deprecated.  Use bhand_controller-srv:action instead.")
  (action m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Actions-request>) ostream)
  "Serializes a message object of type '<Actions-request>"
  (cl:let* ((signed (cl:slot-value msg 'action)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Actions-request>) istream)
  "Deserializes a message object of type '<Actions-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Actions-request>)))
  "Returns string type for a service object of type '<Actions-request>"
  "bhand_controller/ActionsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Actions-request)))
  "Returns string type for a service object of type 'Actions-request"
  "bhand_controller/ActionsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Actions-request>)))
  "Returns md5sum for a message object of type '<Actions-request>"
  "89af4e368677e306adbb14bec6d3e1c0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Actions-request)))
  "Returns md5sum for a message object of type 'Actions-request"
  "89af4e368677e306adbb14bec6d3e1c0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Actions-request>)))
  "Returns full string definition for message of type '<Actions-request>"
  (cl:format cl:nil "~%int32 action~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Actions-request)))
  "Returns full string definition for message of type 'Actions-request"
  (cl:format cl:nil "~%int32 action~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Actions-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Actions-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Actions-request
    (cl:cons ':action (action msg))
))
;//! \htmlinclude Actions-response.msg.html

(cl:defclass <Actions-response> (roslisp-msg-protocol:ros-message)
  ((ret
    :reader ret
    :initarg :ret
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Actions-response (<Actions-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Actions-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Actions-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bhand_controller-srv:<Actions-response> is deprecated: use bhand_controller-srv:Actions-response instead.")))

(cl:ensure-generic-function 'ret-val :lambda-list '(m))
(cl:defmethod ret-val ((m <Actions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-srv:ret-val is deprecated.  Use bhand_controller-srv:ret instead.")
  (ret m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Actions-response>) ostream)
  "Serializes a message object of type '<Actions-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ret) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Actions-response>) istream)
  "Deserializes a message object of type '<Actions-response>"
    (cl:setf (cl:slot-value msg 'ret) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Actions-response>)))
  "Returns string type for a service object of type '<Actions-response>"
  "bhand_controller/ActionsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Actions-response)))
  "Returns string type for a service object of type 'Actions-response"
  "bhand_controller/ActionsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Actions-response>)))
  "Returns md5sum for a message object of type '<Actions-response>"
  "89af4e368677e306adbb14bec6d3e1c0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Actions-response)))
  "Returns md5sum for a message object of type 'Actions-response"
  "89af4e368677e306adbb14bec6d3e1c0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Actions-response>)))
  "Returns full string definition for message of type '<Actions-response>"
  (cl:format cl:nil "bool ret~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Actions-response)))
  "Returns full string definition for message of type 'Actions-response"
  (cl:format cl:nil "bool ret~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Actions-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Actions-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Actions-response
    (cl:cons ':ret (ret msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Actions)))
  'Actions-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Actions)))
  'Actions-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Actions)))
  "Returns string type for a service object of type '<Actions>"
  "bhand_controller/Actions")