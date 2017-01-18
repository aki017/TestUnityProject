using UnityEditor;
using UnityEngine;
using Debug = System.Diagnostics.Debug;

public class BatchBuild : MonoBehaviour
{
  [MenuItem("Assets/Hello")]
  private static void GenerateProject()
  {
    var t = System.Type.GetType("UnityEditor.SyncVS,UnityEditor");
    Debug.Assert(t != null, "t != null");
    var method = t.GetMethod("SyncSolution", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static);
    method.Invoke(null, null);
  }
}
