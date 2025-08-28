using System;
using UnityEngine;
using UnityScript.Lang;

[Serializable]
public class TubeRenderer : MonoBehaviour
{
	public TubeVertex[] vertices;

	public Material material;

	public int crossSegments;

	public float flatAtDistance;

	public int movePixelsForRebuild;

	public float maxRebuildTime;

	public bool useMeshCollision;

	private Vector3 lastCameraPosition1;

	private Vector3 lastCameraPosition2;

	private Vector3[] crossPoints;

	private int lastCrossSegments;

	private float lastRebuildTime;

	private Mesh mesh;

	private bool colliderExists;

	private bool usingBumpmap;

	public TubeRenderer()
	{
		crossSegments = 3;
		flatAtDistance = -1f;
		movePixelsForRebuild = 6;
		maxRebuildTime = 0.1f;
	}

	public virtual void Reset()
	{
		vertices = new TubeVertex[2]
		{
			new TubeVertex(Vector3.zero, 1f, Color.white),
			new TubeVertex(new Vector3(1f, 0f, 0f), 1f, Color.white)
		};
	}

	public virtual void Start()
	{
		Reset();
		mesh = new Mesh();
		gameObject.AddComponent(typeof(MeshFilter));
		MeshRenderer meshRenderer = (MeshRenderer)gameObject.AddComponent(typeof(MeshRenderer));
		meshRenderer.material = material;
		if ((bool)material && (bool)material.GetTexture("_BumpMap"))
		{
			usingBumpmap = true;
		}
	}

	public virtual void LateUpdate()
	{
		if (vertices == null || Extensions.get_length((System.Array)vertices) <= 1)
		{
			renderer.enabled = false;
			return;
		}
		renderer.enabled = true;
		if (crossSegments != lastCrossSegments)
		{
			crossPoints = new Vector3[crossSegments];
			float num = (float)Math.PI * 2f / (float)crossSegments;
			for (int i = 0; i < crossSegments; i++)
			{
				crossPoints[i] = new Vector3(Mathf.Cos(num * (float)i), Mathf.Sin(num * (float)i), 0f);
			}
			lastCrossSegments = crossSegments;
		}
		Vector3[] array = new Vector3[Extensions.get_length((System.Array)vertices) * crossSegments];
		Vector2[] array2 = new Vector2[Extensions.get_length((System.Array)vertices) * crossSegments];
		Color[] array3 = new Color[Extensions.get_length((System.Array)vertices) * crossSegments];
		int[] array4 = new int[Extensions.get_length((System.Array)vertices) * crossSegments * 6];
		int[] array5 = new int[crossSegments];
		int[] array6 = new int[crossSegments];
		Quaternion quaternion = default(Quaternion);
		for (int j = 0; j < Extensions.get_length((System.Array)vertices); j++)
		{
			if (j < Extensions.get_length((System.Array)vertices) - 1)
			{
				quaternion = Quaternion.FromToRotation(Vector3.forward, vertices[j + 1].point - vertices[j].point);
			}
			for (int i = 0; i < crossSegments; i++)
			{
				int num2 = j * crossSegments + i;
				array[num2] = vertices[j].point + quaternion * crossPoints[i] * vertices[j].radius;
				array2[num2] = new Vector2((0f + (float)i) / (float)crossSegments, (0f + (float)j) / (float)Extensions.get_length((System.Array)vertices));
				array3[num2] = vertices[j].color;
				array5[i] = array6[i];
				array6[i] = j * crossSegments + i;
			}
			if (j > 0)
			{
				for (int i = 0; i < crossSegments; i++)
				{
					int num3 = (j * crossSegments + i) * 6;
					array4[num3] = array5[i];
					array4[num3 + 1] = array5[(i + 1) % crossSegments];
					array4[num3 + 2] = array6[i];
					array4[num3 + 3] = array4[num3 + 2];
					array4[num3 + 4] = array4[num3 + 1];
					array4[num3 + 5] = array6[(i + 1) % crossSegments];
				}
			}
		}
		mesh.Clear();
		mesh.vertices = array;
		mesh.triangles = array4;
		mesh.RecalculateNormals();
		if (usingBumpmap)
		{
			mesh.tangents = CalculateTangents(array);
		}
		mesh.uv = array2;
		if (useMeshCollision)
		{
			if (colliderExists)
			{
				((MeshCollider)gameObject.GetComponent(typeof(MeshCollider))).sharedMesh = mesh;
			}
			else
			{
				gameObject.AddComponent(typeof(MeshCollider));
				colliderExists = true;
			}
		}
		((MeshFilter)GetComponent(typeof(MeshFilter))).mesh = mesh;
	}

	public virtual Vector4[] CalculateTangents(Vector3[] verts)
	{
		Vector4[] array = new Vector4[Extensions.get_length((System.Array)verts)];
		for (int i = 0; i < Extensions.get_length((System.Array)array); i++)
		{
			Vector3 vector = ((i <= 0) ? verts[i] : verts[i - 1]);
			Vector3 vector2 = ((i >= Extensions.get_length((System.Array)array) - 1) ? verts[i] : verts[i + 1]);
			Vector3 normalized = (vector - vector2).normalized;
			array[i] = new Vector4(normalized.x, normalized.y, normalized.z, 1f);
		}
		return array;
	}

	public virtual void SetPoints(Vector3[] points, float radius, Color col)
	{
		if (Extensions.get_length((System.Array)points) >= 2)
		{
			vertices = new TubeVertex[Extensions.get_length((System.Array)points) + 2];
			Vector3 vector = (points[0] - points[1]) * 0.01f;
			vertices[0] = new TubeVertex(vector + points[0], 0f, col);
			Vector3 vector2 = (points[Extensions.get_length((System.Array)points) - 1] - points[Extensions.get_length((System.Array)points) - 2]) * 0.01f;
			vertices[Extensions.get_length((System.Array)vertices) - 1] = new TubeVertex(vector2 + points[Extensions.get_length((System.Array)points) - 1], 0f, col);
			for (int i = 0; i < Extensions.get_length((System.Array)points); i++)
			{
				vertices[i + 1] = new TubeVertex(points[i], radius, col);
			}
		}
	}

	public virtual void Main()
	{
	}
}
