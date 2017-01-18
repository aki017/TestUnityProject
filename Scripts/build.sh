#! /bin/sh

project="TestUnityProject"

if [ "$PLATFORM" = "android" ]; then
  echo "Attempting to build $project for Android"
  /Applications/Unity/Unity.app/Contents/MacOS/Unity \
    -batchmode \
    -nographics \
    -silent-crashes \
    -logFile $(pwd)/unity.log \
    -projectPath $(pwd) \
    -buildTarget $PLATFORM
    -executeMethod BatchBuild.GenerateProject
    -quit
fi

if [ "$PLATFORM" = "ios" ]; then
  echo "Attempting to build $project for OS X"
  /Applications/Unity/Unity.app/Contents/MacOS/Unity \
    -batchmode \
    -nographics \
    -silent-crashes \
    -logFile $(pwd)/unity.log \
    -projectPath $(pwd) \
    -buildTarget $PLATFORM
    -executeMethod BatchBuild.GenerateProject
    -quit
fi
echo 'Logs from build'
cat $(pwd)/unity.log
