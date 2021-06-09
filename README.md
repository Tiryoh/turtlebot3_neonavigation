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

```
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_gazebo turtlebot3_world.launch
```

```
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
```

```
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

```
roscd turtlebot3_neonavigation
rosrun map_server map_saver -f turtlebot3_world
```

### Navigation

```
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_gazebo turtlebot3_world.launch
```

```
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_neonavigation turtlebot3_neonavigation.launch map_file:=$(rospack find turtlebot3_neonavigation)/maps/turtlebot3_world.yaml
```