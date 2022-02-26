#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/baxter/mn/src/robotiq/robotiq_2f_gripper_control"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/baxter/mn/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/baxter/mn/install/lib/python2.7/dist-packages:/home/baxter/mn/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/baxter/mn/build" \
    "/usr/bin/python" \
    "/home/baxter/mn/src/robotiq/robotiq_2f_gripper_control/setup.py" \
    build --build-base "/home/baxter/mn/build/robotiq/robotiq_2f_gripper_control" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/baxter/mn/install" --install-scripts="/home/baxter/mn/install/bin"