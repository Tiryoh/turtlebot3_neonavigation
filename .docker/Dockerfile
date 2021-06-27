FROM osrf/ros:melodic-desktop-full

WORKDIR /root/catkin_ws
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - && \
    apt-get update && \
    apt-get install -y python-vcstool python-catkin-tools python-pip \
            vim less bash bash-completion tmux byobu iputils-ping net-tools dnsutils \
            terminator && \
    rm -rf /var/lib/apt/lists/*

# Avoid org.freedesktop.DBus.Error.Spawn.ExecFailed
# https://forums.bunsenlabs.org/viewtopic.php?pid=59732#p59732
RUN mkdir -p /root/.config/terminator && \
    echo '[global_config]' | tee -a /root/.config/terminator/config && \
    echo '    dbus = "False"' | tee -a /root/.config/terminator/config
RUN mkdir -p src && \
    . /opt/ros/melodic/setup.sh && \
    catkin init && \
    catkin build

WORKDIR /root/catkin_ws/src
COPY .ci.rosinstall /root/catkin_ws/src/turtlebot3_neonavigation/.ci.rosinstall
COPY package.xml /root/catkin_ws/src/turtlebot3_neonavigation/package.xml
COPY CMakeLists.txt /root/catkin_ws/src/turtlebot3_neonavigation/CMakeLists.txt
RUN apt-get update && \
    . /opt/ros/melodic/setup.sh && \
    vcs import < turtlebot3_neonavigation/.ci.rosinstall && \
    rosdep update && \
    rosdep install -r -y -i --from-paths . && \
    rm -rf /var/lib/apt/lists/*

COPY config /root/catkin_ws/src/turtlebot3_neonavigation/config
COPY launch /root/catkin_ws/src/turtlebot3_neonavigation/launch
COPY maps /root/catkin_ws/src/turtlebot3_neonavigation/maps

WORKDIR /root/catkin_ws
RUN . /opt/ros/melodic/setup.sh && \
    catkin build && \
    . /root/catkin_ws/devel/setup.sh && \
    sed -i -e "s/^exec/#exec/g" /ros_entrypoint.sh && \
    echo "source /root/catkin_ws/devel/setup.bash" | tee -a /ros_entrypoint.sh && \
    echo 'exec "$@"' | tee -a /ros_entrypoint.sh && \
    echo "source /root/catkin_ws/devel/setup.bash" | tee -a /root/.bashrc && \
    echo 'export TURTLEBOT3_MODEL="burger"' | tee -a /root/.bashrc
ENV ROS_MASTER_URI=http://127.0.0.1:11311
ENV ROS_IP=127.0.0.1