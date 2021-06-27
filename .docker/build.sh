#!/usr/bin/env bash
set -ue

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0})/../; pwd)

cd $SRC_DIR
docker build -t tiryoh/turtlebot3_neonavigation:melodic -f .docker/Dockerfile .