using System;
using UnityEngine;

[Serializable]
public class TubeVertex
{
	public Vector3 point;

	public float radius;

	public Color color;

	public TubeVertex(Vector3 pt, float r, Color c)
	{
		point = Vector3.zero;
		radius = 1f;
		color = Color.white;
		point = pt;
		radius = r;
		color = c;
	}
}
