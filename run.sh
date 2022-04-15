#!/bin/sh -e

build(){
  echo "run build"
  docker build -t romaspirin/tnt-cow:simple .
}

run(){
  build
  echo "run app"
  if [[ `docker ps|grep tnt-cow:local` ]]; then
    stop
  fi
  docker run --env TARANTOOL_USER_NAME=myusername \
    --env TARANTOOL_USER_PASSWORD=mysecretpassword \
    -d \
    -p "3301:3301" \
    -v "$(pwd)/src:/opt/tarantool" \
    --network cow-net \
    --name tnt-cow \
    romaspirin/tnt-cow:simple  tarantool app.lua
}

unit() {
  echo "run unit tests"
  docker run --rm -v $(pwd):/work:rw -w /work/src tarantool/tarantool:2.10.0-beta1 luatest -v -c
}

command="$1"
if [ -z "$command" ]
then
 using
 exit 0;
else
 $command $@
fi