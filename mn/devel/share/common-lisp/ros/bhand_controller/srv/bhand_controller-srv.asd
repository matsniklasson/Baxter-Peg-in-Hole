
(cl:in-package :asdf)

(defsystem "bhand_controller-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Actions" :depends-on ("_package_Actions"))
    (:file "_package_Actions" :depends-on ("_package"))
    (:file "SetControlMode" :depends-on ("_package_SetControlMode"))
    (:file "_package_SetControlMode" :depends-on ("_package"))
  ))