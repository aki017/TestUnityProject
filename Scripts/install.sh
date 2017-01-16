#! /bin/sh

#BASE_URL=http://netstorage.unity3d.com/unity
BASE_URL=http://beta.unity3d.com/download
HASH=2f9c3a0f4141
VERSION=5.5.0p4

download() {
  file=$1
  url="$BASE_URL/$HASH/$package"

  echo "Downloading from $url: "
  curl -o `basename "$package"` "$url"
}

install() {
  package=$1
  download "$package"

  echo "Installing "`basename "$package"`
  sudo installer -dumplog -package `basename "$package"` -target /
}

# See $BASE_URL/$HASH/unity-$VERSION-$PLATFORM.ini for complete list
# of available packages, where PLATFORM is `osx` or `win`


echo "Check install"
if [ -e /Applications ]; then
  echo "/Applications exists"
  installed_version=`plutil -extract CFBundleVersion xml1 /Application/Unity/Unity.app/Contents/Info.plist -o -|plutil -p -`
  echo $installed_version
  if [ "$installed_version" = "\"$VERSION\"" ]; then
    exit 0
  fi
fi

install "MacEditorInstaller/Unity-$VERSION.pkg"
install "MacEditorTargetInstaller/UnitySetup-Windows-Support-for-Editor-$VERSION.pkg"
install "MacEditorTargetInstaller/UnitySetup-Mac-Support-for-Editor-$VERSION.pkg"
install "MacEditorTargetInstaller/UnitySetup-Linux-Support-for-Editor-$VERSION.pkg"
