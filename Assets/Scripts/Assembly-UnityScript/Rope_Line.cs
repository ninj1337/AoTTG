using System;
using UnityEngine;
using UnityScript.Lang;

[Serializable]
[RequireComponent(typeof(Rigidbody))]
public class Rope_Line : MonoBehaviour
{
	public Transform target;

	public Material material;

	public float ropeWidth;

	public float resolution;

	public float ropeDrag;

	public float ropeMass;

	public int radialSegments;

	public bool startRestrained;

	public bool endRestrained;

	public bool useMeshCollision;

	private Vector3[] segmentPos;

	private GameObject[] joints;

	private GameObject tubeRenderer;

	private TubeRenderer line;

	private int segments;

	private bool rope;

	public Vector3 swingAxis;

	public float lowTwistLimit;

	public float highTwistLimit;

	public float swing1Limit;

	public Rope_Line()
	{
		ropeWidth = 0.5f;
		resolution = 0.5f;
		ropeDrag = 0.1f;
		ropeMass = 0.5f;
		radialSegments = 6;
		startRestrained = true;
		segments = 20;
		swingAxis = new Vector3(0f, 1f, 0f);
		swing1Limit = 20f;
	}

	public virtual void OnDrawGizmos()
	{
		if ((bool)target)
		{
			Gizmos.color = Color.yellow;
			Gizmos.DrawLine(transform.position, target.position);
			Gizmos.DrawWireSphere((transform.position + target.position) / 2f, ropeWidth);
			Gizmos.color = Color.green;
			Gizmos.DrawWireSphere(transform.position, ropeWidth);
			Gizmos.color = Color.red;
			Gizmos.DrawWireSphere(target.position, ropeWidth);
		}
		else
		{
			Gizmos.color = Color.green;
			Gizmos.DrawWireSphere(transform.position, ropeWidth);
		}
	}

	public virtual void Awake()
	{
		if ((bool)target)
		{
			BuildRope();
		}
		else
		{
			Debug.LogError("You must have a gameobject attached to target: " + name, this);
		}
	}

	public virtual void LateUpdate()
	{
		if ((bool)target && rope)
		{
			line.SetPoints(segmentPos, ropeWidth, Color.white);
			line.enabled = true;
			segmentPos[0] = transform.position;
			for (int i = 1; i < segments; i++)
			{
				segmentPos[i] = joints[i].transform.position;
			}
		}
	}

	public virtual void BuildRope()
	{
		tubeRenderer = new GameObject("TubeRenderer_" + gameObject.name);
		line = (TubeRenderer)tubeRenderer.AddComponent(typeof(TubeRenderer));
		line.useMeshCollision = useMeshCollision;
		segments = (int)(Vector3.Distance(transform.position, target.position) * resolution);
		if ((bool)material)
		{
			material.SetTextureScale("_MainTex", new Vector2(1f, segments + 2));
			if ((bool)material.GetTexture("_BumpMap"))
			{
				material.SetTextureScale("_BumpMap", new Vector2(1f, segments + 2));
			}
		}
		line.vertices = new TubeVertex[segments];
		line.crossSegments = radialSegments;
		line.material = material;
		segmentPos = new Vector3[segments];
		joints = new GameObject[segments];
		segmentPos[0] = transform.position;
		segmentPos[segments - 1] = target.position;
		int num = segments - 1;
		Vector3 vector = (target.position - transform.position) / num;
		for (int i = 0; i < segments; i++)
		{
			Vector3 vector2 = vector * i + transform.position;
			segmentPos[i] = vector2;
			AddJointPhysics(i);
		}
		CharacterJoint characterJoint = (CharacterJoint)target.gameObject.AddComponent("CharacterJoint");
		characterJoint.connectedBody = joints[joints.Length - 1].transform.rigidbody;
		characterJoint.swingAxis = swingAxis;
		float num2 = lowTwistLimit;
		SoftJointLimit softJointLimit = characterJoint.lowTwistLimit;
		float num3 = (softJointLimit.limit = num2);
		SoftJointLimit softJointLimit2 = (characterJoint.lowTwistLimit = softJointLimit);
		float num5 = highTwistLimit;
		SoftJointLimit softJointLimit4 = characterJoint.highTwistLimit;
		float num6 = (softJointLimit4.limit = num5);
		SoftJointLimit softJointLimit5 = (characterJoint.highTwistLimit = softJointLimit4);
		float num8 = swing1Limit;
		SoftJointLimit softJointLimit7 = characterJoint.swing1Limit;
		float num9 = (softJointLimit7.limit = num8);
		SoftJointLimit softJointLimit8 = (characterJoint.swing1Limit = softJointLimit7);
		target.parent = transform;
		if (endRestrained)
		{
			characterJoint.rigidbody.isKinematic = true;
		}
		if (startRestrained)
		{
			transform.rigidbody.isKinematic = true;
		}
		rope = true;
	}

	public virtual void AddJointPhysics(int n)
	{
		joints[n] = new GameObject("Joint_" + n);
		joints[n].transform.parent = transform;
		Rigidbody rigidbody = (Rigidbody)joints[n].AddComponent("Rigidbody");
		if (!useMeshCollision)
		{
			SphereCollider sphereCollider = (SphereCollider)joints[n].AddComponent("SphereCollider");
			sphereCollider.radius = ropeWidth;
		}
		CharacterJoint characterJoint = (CharacterJoint)joints[n].AddComponent("CharacterJoint");
		characterJoint.swingAxis = swingAxis;
		float num = lowTwistLimit;
		SoftJointLimit softJointLimit = characterJoint.lowTwistLimit;
		float num2 = (softJointLimit.limit = num);
		SoftJointLimit softJointLimit2 = (characterJoint.lowTwistLimit = softJointLimit);
		float num4 = highTwistLimit;
		SoftJointLimit softJointLimit4 = characterJoint.highTwistLimit;
		float num5 = (softJointLimit4.limit = num4);
		SoftJointLimit softJointLimit5 = (characterJoint.highTwistLimit = softJointLimit4);
		float num7 = swing1Limit;
		SoftJointLimit softJointLimit7 = characterJoint.swing1Limit;
		float num8 = (softJointLimit7.limit = num7);
		SoftJointLimit softJointLimit8 = (characterJoint.swing1Limit = softJointLimit7);
		joints[n].transform.position = segmentPos[n];
		rigidbody.drag = ropeDrag;
		rigidbody.mass = ropeMass;
		if (n == 0)
		{
			characterJoint.connectedBody = transform.rigidbody;
		}
		else
		{
			characterJoint.connectedBody = joints[n - 1].rigidbody;
		}
	}

	public virtual void Main()
	{
	}
}
