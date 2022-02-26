# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "bhand_controller: 4 messages, 2 services")

set(MSG_I_FLAGS "-Ibhand_controller:/home/baxter/mn/src/barrett_hand/bhand_controller/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(bhand_controller_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/Actions.srv" NAME_WE)
add_custom_target(_bhand_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bhand_controller" "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/Actions.srv" ""
)

get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/Service.msg" NAME_WE)
add_custom_target(_bhand_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bhand_controller" "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/Service.msg" ""
)

get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/SetControlMode.srv" NAME_WE)
add_custom_target(_bhand_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bhand_controller" "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/SetControlMode.srv" ""
)

get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/ForceTorque.msg" NAME_WE)
add_custom_target(_bhand_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bhand_controller" "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/ForceTorque.msg" "geometry_msgs/Vector3:std_msgs/Header"
)

get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/State.msg" NAME_WE)
add_custom_target(_bhand_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bhand_controller" "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/State.msg" ""
)

get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/TactileArray.msg" NAME_WE)
add_custom_target(_bhand_controller_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bhand_controller" "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/TactileArray.msg" "std_msgs/Header"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/State.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bhand_controller
)
_generate_msg_cpp(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/Service.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bhand_controller
)
_generate_msg_cpp(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/ForceTorque.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bhand_controller
)
_generate_msg_cpp(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/TactileArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bhand_controller
)

### Generating Services
_generate_srv_cpp(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/Actions.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bhand_controller
)
_generate_srv_cpp(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/SetControlMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bhand_controller
)

### Generating Module File
_generate_module_cpp(bhand_controller
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bhand_controller
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(bhand_controller_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(bhand_controller_generate_messages bhand_controller_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/Actions.srv" NAME_WE)
add_dependencies(bhand_controller_generate_messages_cpp _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/Service.msg" NAME_WE)
add_dependencies(bhand_controller_generate_messages_cpp _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/SetControlMode.srv" NAME_WE)
add_dependencies(bhand_controller_generate_messages_cpp _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/ForceTorque.msg" NAME_WE)
add_dependencies(bhand_controller_generate_messages_cpp _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/State.msg" NAME_WE)
add_dependencies(bhand_controller_generate_messages_cpp _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/TactileArray.msg" NAME_WE)
add_dependencies(bhand_controller_generate_messages_cpp _bhand_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bhand_controller_gencpp)
add_dependencies(bhand_controller_gencpp bhand_controller_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bhand_controller_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/State.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bhand_controller
)
_generate_msg_lisp(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/Service.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bhand_controller
)
_generate_msg_lisp(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/ForceTorque.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bhand_controller
)
_generate_msg_lisp(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/TactileArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bhand_controller
)

### Generating Services
_generate_srv_lisp(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/Actions.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bhand_controller
)
_generate_srv_lisp(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/SetControlMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bhand_controller
)

### Generating Module File
_generate_module_lisp(bhand_controller
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bhand_controller
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(bhand_controller_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(bhand_controller_generate_messages bhand_controller_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/Actions.srv" NAME_WE)
add_dependencies(bhand_controller_generate_messages_lisp _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/Service.msg" NAME_WE)
add_dependencies(bhand_controller_generate_messages_lisp _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/SetControlMode.srv" NAME_WE)
add_dependencies(bhand_controller_generate_messages_lisp _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/ForceTorque.msg" NAME_WE)
add_dependencies(bhand_controller_generate_messages_lisp _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/State.msg" NAME_WE)
add_dependencies(bhand_controller_generate_messages_lisp _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/TactileArray.msg" NAME_WE)
add_dependencies(bhand_controller_generate_messages_lisp _bhand_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bhand_controller_genlisp)
add_dependencies(bhand_controller_genlisp bhand_controller_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bhand_controller_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/State.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bhand_controller
)
_generate_msg_py(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/Service.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bhand_controller
)
_generate_msg_py(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/ForceTorque.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bhand_controller
)
_generate_msg_py(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/TactileArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bhand_controller
)

### Generating Services
_generate_srv_py(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/Actions.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bhand_controller
)
_generate_srv_py(bhand_controller
  "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/SetControlMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bhand_controller
)

### Generating Module File
_generate_module_py(bhand_controller
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bhand_controller
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(bhand_controller_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(bhand_controller_generate_messages bhand_controller_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/Actions.srv" NAME_WE)
add_dependencies(bhand_controller_generate_messages_py _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/Service.msg" NAME_WE)
add_dependencies(bhand_controller_generate_messages_py _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/srv/SetControlMode.srv" NAME_WE)
add_dependencies(bhand_controller_generate_messages_py _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/ForceTorque.msg" NAME_WE)
add_dependencies(bhand_controller_generate_messages_py _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/State.msg" NAME_WE)
add_dependencies(bhand_controller_generate_messages_py _bhand_controller_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/baxter/mn/src/barrett_hand/bhand_controller/msg/TactileArray.msg" NAME_WE)
add_dependencies(bhand_controller_generate_messages_py _bhand_controller_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bhand_controller_genpy)
add_dependencies(bhand_controller_genpy bhand_controller_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bhand_controller_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bhand_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bhand_controller
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(bhand_controller_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(bhand_controller_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bhand_controller)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bhand_controller
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(bhand_controller_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(bhand_controller_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bhand_controller)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bhand_controller\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bhand_controller
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bhand_controller
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bhand_controller/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(bhand_controller_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(bhand_controller_generate_messages_py geometry_msgs_generate_messages_py)
endif()
