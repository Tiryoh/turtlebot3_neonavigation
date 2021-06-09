cmake_minimum_required(VERSION 3.0.2)
project(turtlebot3_neonavigation)

find_package(catkin REQUIRED)

catkin_package()

install(DIRECTORY config launch maps
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

if (CATKIN_ENABLE_TESTING)
  find_package(roslaunch REQUIRED)
  roslaunch_add_file_check(launch)
endif()
