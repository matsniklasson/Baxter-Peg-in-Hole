
(cl:in-package :asdf)

(defsystem "bhand_controller-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "State" :depends-on ("_package_State"))
    (:file "_package_State" :depends-on ("_package"))
    (:file "Service" :depends-on ("_package_Service"))
    (:file "_package_Service" :depends-on ("_package"))
    (:file "ForceTorque" :depends-on ("_package_ForceTorque"))
    (:file "_package_ForceTorque" :depends-on ("_package"))
    (:file "TactileArray" :depends-on ("_package_TactileArray"))
    (:file "_package_TactileArray" :depends-on ("_package"))
  ))