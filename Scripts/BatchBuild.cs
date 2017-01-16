using UnityEngine;
using UnityEditor;
using System;
using System.Linq;

public class BuildBatch : MonoBehaviour {
  private static void BuildAndroid() {
    string outputPath = Application.dataPath + "/../out.apk";
    BuildTarget target = BuildTarget.Android;
    BuildOptions opt = BuildOptions.SymlinkLibraries;
    var scenePaths = EditorBuildSettings.scenes.Select(scene => scene.path).ToArray();
    string error = BuildPipeline.BuildPlayer(scenePaths, outputPath, target, opt);
    if (!string.IsNullOrEmpty(error))
      Debug.LogError(error);
    EditorApplication.Exit(string.IsNullOrEmpty(error) ? 0 : 1);
  }

  private static void BuildIos() {
    string outputPath = Application.dataPath + "/../outios";
    BuildOptions opt = BuildOptions.SymlinkLibraries;
    var scenePaths = EditorBuildSettings.scenes.Select(scene => scene.path).ToArray();
    string error = BuildPipeline.BuildPlayer(scenePaths, outputPath, target, opt);
    if (!string.IsNullOrEmpty(error))
      Debug.LogError(error);
    EditorApplication.Exit(string.IsNullOrEmpty(error) ? 0 : 1);
  }
}
