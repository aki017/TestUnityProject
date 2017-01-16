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
    -buildWindowsPlayer "$(pwd)/Build/windows/$project.exe" \
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
    -buildOSXUniversalPlayer "$(pwd)/Build/osx/$project.app" \
    -quit
fi
echo 'Logs from build'
cat $(pwd)/unity.log
