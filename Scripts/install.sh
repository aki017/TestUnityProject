#! /bin/sh

#BASE_URL=http://netstorage.unity3d.com/unity
BASE_URL=http://beta.unity3d.com/download

download() {
  file=$1
  url="$BASE_URL/$UNITY_HASH/$package"

  echo "Downloading from $url: "
  curl -o `basename "$package"` "$url"
}

install() {
  package=$1
  echo "DownLoading "`basename "$package"`
  download "$package"

  echo "Installing "`basename "$package"`
  sudo installer -dumplog -package `basename "$package"` -target /
}

# See $BASE_URL/$UNITY_HASH/unity-$UNITY_VERSION-$PLATFORM.ini for complete list
# of available packages, where PLATFORM is `osx` or `win`

echo "Check install"
if [ -e /Applications/Unity ]; then
  echo "/Applications/Unity exists"
  ls -al /Applications/Unity
  ls -al /Applications/Unity/Unity.app
  ls -al /Applications/Unity/Unity.app/Contents
  installed_version=`plutil -extract CFBundleVersion xml1 /Applications/Unity/Unity.app/Contents/Info.plist -o -|plutil -p -`
  echo $installed_version
  if [ "$installed_version" = "\"$UNITY_VERSION\"" ]; then
    exit 0
  fi
fi

install "MacEditorInstaller/Unity-$UNITY_VERSION.pkg"
install "MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-$UNITY_VERSION.pkg"
install "MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-$UNITY_VERSION.pkg"

