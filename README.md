# turtlebot3_neonavigation

## Installation

```
git clone https://github.com/Tiryoh/turtlebot3_neonavigation.git
```

```
vcs import . < turtlebot3_neonavigation/.ci.rosinstall
rosdep install -r -y -i --from-paths .
```

## Usage

### SLAM

#### Launch Gazebo Simulator

```
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_gazebo turtlebot3_world.launch
```

#### Start [GMapping](https://openslam-org.github.io/gmapping.html)

```
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
```

#### Start teleop node for moving robot

```
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

#### Save map

```
roscd turtlebot3_neonavigation
rosrun map_server map_saver -f turtlebot3_world
```

![Image from Gyazo](https://i.gyazo.com/cca9cb712d3864c8ecacc6d6a43d8640.png)

### Navigation

#### Launch Gazebo Simulator

```
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_gazebo turtlebot3_world.launch
```

#### Start neonavigation

[amcl](http://wiki.ros.org/amcl) or [emcl](https://github.com/ryuichiueda/emcl) is available for localization.

##### amcl

```
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_neonavigation turtlebot3_neonavigation.launch map_file:=$(rospack find turtlebot3_neonavigation)/maps/turtlebot3_world.yaml localization:=amc
```

![Image from Gyazo](https://i.gyazo.com/2ea6a2a6bcb3a4054eac1ed1b10f294f.gif)

##### emcl



```
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_neonavigation turtlebot3_neonavigation.launch map_file:=$(rospack find turtlebot3_neonavigation)/maps/turtlebot3_world.yaml localization:=emc
```

![Image from Gyazo](https://i.gyazo.com/cfcfebb709a163ac8756b145df230341.gif)
