; Auto-generated. Do not edit!


(cl:in-package bhand_controller-msg)


;//! \htmlinclude State.msg.html

(cl:defclass <State> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type cl:integer
    :initform 0)
   (control_mode
    :reader control_mode
    :initarg :control_mode
    :type cl:string
    :initform "")
   (hand_initialized
    :reader hand_initialized
    :initarg :hand_initialized
    :type cl:boolean
    :initform cl:nil)
   (desired_freq
    :reader desired_freq
    :initarg :desired_freq
    :type cl:float
    :initform 0.0)
   (real_freq
    :reader real_freq
    :initarg :real_freq
    :type cl:float
    :initform 0.0)
   (state_description
    :reader state_description
    :initarg :state_description
    :type cl:string
    :initform "")
   (temp_f1
    :reader temp_f1
    :initarg :temp_f1
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0))
   (temp_f2
    :reader temp_f2
    :initarg :temp_f2
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0))
   (temp_f3
    :reader temp_f3
    :initarg :temp_f3
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0))
   (temp_spread
    :reader temp_spread
    :initarg :temp_spread
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass State (<State>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <State>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'State)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bhand_controller-msg:<State> is deprecated: use bhand_controller-msg:State instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-msg:state-val is deprecated.  Use bhand_controller-msg:state instead.")
  (state m))

(cl:ensure-generic-function 'control_mode-val :lambda-list '(m))
(cl:defmethod control_mode-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-msg:control_mode-val is deprecated.  Use bhand_controller-msg:control_mode instead.")
  (control_mode m))

(cl:ensure-generic-function 'hand_initialized-val :lambda-list '(m))
(cl:defmethod hand_initialized-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-msg:hand_initialized-val is deprecated.  Use bhand_controller-msg:hand_initialized instead.")
  (hand_initialized m))

(cl:ensure-generic-function 'desired_freq-val :lambda-list '(m))
(cl:defmethod desired_freq-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-msg:desired_freq-val is deprecated.  Use bhand_controller-msg:desired_freq instead.")
  (desired_freq m))

(cl:ensure-generic-function 'real_freq-val :lambda-list '(m))
(cl:defmethod real_freq-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-msg:real_freq-val is deprecated.  Use bhand_controller-msg:real_freq instead.")
  (real_freq m))

(cl:ensure-generic-function 'state_description-val :lambda-list '(m))
(cl:defmethod state_description-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-msg:state_description-val is deprecated.  Use bhand_controller-msg:state_description instead.")
  (state_description m))

(cl:ensure-generic-function 'temp_f1-val :lambda-list '(m))
(cl:defmethod temp_f1-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-msg:temp_f1-val is deprecated.  Use bhand_controller-msg:temp_f1 instead.")
  (temp_f1 m))

(cl:ensure-generic-function 'temp_f2-val :lambda-list '(m))
(cl:defmethod temp_f2-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-msg:temp_f2-val is deprecated.  Use bhand_controller-msg:temp_f2 instead.")
  (temp_f2 m))

(cl:ensure-generic-function 'temp_f3-val :lambda-list '(m))
(cl:defmethod temp_f3-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-msg:temp_f3-val is deprecated.  Use bhand_controller-msg:temp_f3 instead.")
  (temp_f3 m))

(cl:ensure-generic-function 'temp_spread-val :lambda-list '(m))
(cl:defmethod temp_spread-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bhand_controller-msg:temp_spread-val is deprecated.  Use bhand_controller-msg:temp_spread instead.")
  (temp_spread m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<State>)))
    "Constants for message type '<State>"
  '((:INIT_STATE . 100)
    (:STANDBY_STATE . 200)
    (:READY_STATE . 300)
    (:EMERGENCY_STATE . 400)
    (:FAILURE_STATE . 500)
    (:SHUTDOWN_STATE . 600))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'State)))
    "Constants for message type 'State"
  '((:INIT_STATE . 100)
    (:STANDBY_STATE . 200)
    (:READY_STATE . 300)
    (:EMERGENCY_STATE . 400)
    (:FAILURE_STATE . 500)
    (:SHUTDOWN_STATE . 600))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <State>) ostream)
  "Serializes a message object of type '<State>"
  (cl:let* ((signed (cl:slot-value msg 'state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'control_mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'control_mode))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'hand_initialized) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'desired_freq))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'real_freq))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'state_description))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'state_description))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'temp_f1))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'temp_f2))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'temp_f3))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'temp_spread))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <State>) istream)
  "Deserializes a message object of type '<State>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'control_mode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'control_mode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'hand_initialized) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'desired_freq) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'real_freq) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state_description) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'state_description) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:setf (cl:slot-value msg 'temp_f1) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'temp_f1)))
    (cl:dotimes (i 2)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'temp_f2) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'temp_f2)))
    (cl:dotimes (i 2)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'temp_f3) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'temp_f3)))
    (cl:dotimes (i 2)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'temp_spread) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'temp_spread)))
    (cl:dotimes (i 2)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<State>)))
  "Returns string type for a message object of type '<State>"
  "bhand_controller/State")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'State)))
  "Returns string type for a message object of type 'State"
  "bhand_controller/State")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<State>)))
  "Returns md5sum for a message object of type '<State>"
  "43dbdaf8df84846b4d0203e0d6845e11")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'State)))
  "Returns md5sum for a message object of type 'State"
  "43dbdaf8df84846b4d0203e0d6845e11")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<State>)))
  "Returns full string definition for message of type '<State>"
  (cl:format cl:nil "# constants~%int32 INIT_STATE = 100~%int32 STANDBY_STATE = 200~%int32 READY_STATE = 300~%int32 EMERGENCY_STATE = 400~%int32 FAILURE_STATE = 500~%int32 SHUTDOWN_STATE = 600~%~%~%# state of the component~%int32 state~%# Control mode~%string control_mode~%# Flag active when the hand position has been initialized~%bool hand_initialized~%# desired control loop frecuency~%float32 desired_freq~%# real frecuency ~%float32 real_freq~%# Description of the state~%string state_description~%# [temp_motor, temp_puck]~%float32[2] temp_f1~%# [temp_motor, temp_puck]~%float32[2] temp_f2~%# [temp_motor, temp_puck]~%float32[2] temp_f3~%# [temp_motor, temp_puck]~%float32[2] temp_spread~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'State)))
  "Returns full string definition for message of type 'State"
  (cl:format cl:nil "# constants~%int32 INIT_STATE = 100~%int32 STANDBY_STATE = 200~%int32 READY_STATE = 300~%int32 EMERGENCY_STATE = 400~%int32 FAILURE_STATE = 500~%int32 SHUTDOWN_STATE = 600~%~%~%# state of the component~%int32 state~%# Control mode~%string control_mode~%# Flag active when the hand position has been initialized~%bool hand_initialized~%# desired control loop frecuency~%float32 desired_freq~%# real frecuency ~%float32 real_freq~%# Description of the state~%string state_description~%# [temp_motor, temp_puck]~%float32[2] temp_f1~%# [temp_motor, temp_puck]~%float32[2] temp_f2~%# [temp_motor, temp_puck]~%float32[2] temp_f3~%# [temp_motor, temp_puck]~%float32[2] temp_spread~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <State>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'control_mode))
     1
     4
     4
     4 (cl:length (cl:slot-value msg 'state_description))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'temp_f1) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'temp_f2) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'temp_f3) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'temp_spread) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <State>))
  "Converts a ROS message object to a list"
  (cl:list 'State
    (cl:cons ':state (state msg))
    (cl:cons ':control_mode (control_mode msg))
    (cl:cons ':hand_initialized (hand_initialized msg))
    (cl:cons ':desired_freq (desired_freq msg))
    (cl:cons ':real_freq (real_freq msg))
    (cl:cons ':state_description (state_description msg))
    (cl:cons ':temp_f1 (temp_f1 msg))
    (cl:cons ':temp_f2 (temp_f2 msg))
    (cl:cons ':temp_f3 (temp_f3 msg))
    (cl:cons ':temp_spread (temp_spread msg))
))
