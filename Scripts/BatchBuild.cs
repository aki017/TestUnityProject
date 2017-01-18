using UnityEngine;
using UnityEditor;
using System;
using System.Linq;

public class BatchBuild : MonoBehaviour {
  private static void GenerateProject {
    System.Type T = System.Type.GetType("UnityEditor.SyncVS,UnityEditor");
    System.Reflection.MethodInfo SyncSolution = T.GetMethod("SyncSolution", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static);
    SyncSolution.Invoke(null, null);
  }
}
