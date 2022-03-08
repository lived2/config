#!/bin/sh

cmake -S ./ -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Release -B ./build/release
cmake -S ./ -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Debug -B ./build/debug

ln -s build/debug/compile_commands.json compile_commands.json

echo "exec ./"$project > build/debug/run.sh
chmod 755 build/debug/run.sh
