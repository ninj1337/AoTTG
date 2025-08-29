using System;
using System.Collections;
using System.Collections.Generic;
using Boo.Lang;
using UnityEngine;

public abstract class __LoginBase : MonoBehaviour
{
	protected abstract IEnumerator _Login();
	public virtual IEnumerator Login()
	{
		return _Login();
	}
}

[Serializable]
public class Login : __LoginBase
{
	[Serializable]
	internal sealed class _0024LoadImage_002421 : GenericGenerator<WWW>
	{
		[Serializable]
		internal sealed class _0024 : GenericGeneratorEnumerator<WWW>, IEnumerator
		{
			internal WWWForm _0024form_002422;

			internal WWW _0024w_002423;

			internal Login _0024self__002424;

			public _0024(Login self_)
			{
				_0024self__002424 = self_;
			}

			public override bool MoveNext()
			{
				int result;
				switch (_state)
				{
				default:
					_0024form_002422 = new WWWForm();
					_0024form_002422.AddField("act", "62");
					_0024w_002423 = new WWW(_0024self__002424.imageURL, _0024form_002422);
					result = (Yield(2, _0024w_002423) ? 1 : 0);
					break;
				case 2:
					if (_0024w_002423.error != null)
					{
						MonoBehaviour.print(_0024w_002423.error);
					}
					else
					{
						MonoBehaviour.print("Test ok");
						_0024self__002424.tu.texture = _0024w_002423.texture;
						_0024w_002423.Dispose();
					}
					YieldDefault(1);
					goto case 1;
				case 1:
					result = 0;
					break;
				}
				return (byte)result != 0;
			}
		}

		internal Login _0024self__002425;

		public _0024LoadImage_002421(Login self_)
		{
			_0024self__002425 = self_;
		}

		public override IEnumerator<WWW> GetEnumerator()
		{
			return new _0024(_0024self__002425);
		}
	}

	[Serializable]
	internal sealed class _0024Login_002426 : GenericGenerator<WWW>
	{
		[Serializable]
		internal sealed class _0024 : GenericGeneratorEnumerator<WWW>, IEnumerator
		{
			internal WWWForm _0024form_002427;

			internal WWW _0024w_002428;

			internal Login _0024self__002429;

			public _0024(Login self_)
			{
				_0024self__002429 = self_;
			}

			public override bool MoveNext()
			{
				int result;
				switch (_state)
				{
				default:
					_0024form_002427 = new WWWForm();
					_0024form_002427.AddField("hash", _0024self__002429.hash);
					_0024form_002427.AddField("name", _0024self__002429.formNick);
					_0024form_002427.AddField("password", _0024self__002429.formPassword);
					_0024form_002427.AddField("yzm", _0024self__002429.formyzm);
					_0024w_002428 = new WWW(_0024self__002429.CheckUserURL, _0024form_002427);
					result = (Yield(2, _0024w_002428) ? 1 : 0);
					break;
				case 2:
					if (_0024w_002428.error != null)
					{
						MonoBehaviour.print(_0024w_002428.error);
					}
					else
					{
						MonoBehaviour.print("Test ok");
						_0024self__002429.formText = _0024w_002428.text;
						_0024w_002428.Dispose();
						if (_0024self__002429.formText == "密码正确，欢迎登录")
						{
							Application.LoadLevel(1);
						}
					}
					_0024self__002429.formNick = string.Empty;
					_0024self__002429.formPassword = string.Empty;
					_0024self__002429.formyzm = string.Empty;
					YieldDefault(1);
					goto case 1;
				case 1:
					result = 0;
					break;
				}
				return (byte)result != 0;
			}
		}

		internal Login _0024self__002430;

		public _0024Login_002426(Login self_)
		{
			_0024self__002430 = self_;
		}

		public override IEnumerator<WWW> GetEnumerator()
		{
			return new _0024(_0024self__002430);
		}
	}

	[Serializable]
	internal sealed class _0024Register_002431 : GenericGenerator<WWW>
	{
		[Serializable]
		internal sealed class _0024 : GenericGeneratorEnumerator<WWW>, IEnumerator
		{
			internal WWWForm _0024form_002432;

			internal WWW _0024w_002433;

			internal Login _0024self__002434;

			public _0024(Login self_)
			{
				_0024self__002434 = self_;
			}

			public override bool MoveNext()
			{
				int result;
				switch (_state)
				{
				default:
					_0024form_002432 = new WWWForm();
					_0024form_002432.AddField("hash", _0024self__002434.hash);
					_0024form_002432.AddField("name", _0024self__002434.formNick);
					_0024form_002432.AddField("password", _0024self__002434.formPassword);
					_0024form_002432.AddField("email", _0024self__002434.formEmail);
					_0024w_002433 = new WWW(_0024self__002434.RegisterURL, _0024form_002432);
					result = (Yield(2, _0024w_002433) ? 1 : 0);
					break;
				case 2:
					if (_0024w_002433.error != null)
					{
						MonoBehaviour.print(_0024w_002433.error);
					}
					else
					{
						MonoBehaviour.print("Register ok");
						_0024w_002433.Dispose();
					}
					_0024self__002434.formNick = string.Empty;
					_0024self__002434.formPassword = string.Empty;
					_0024self__002434.formyzm = string.Empty;
					YieldDefault(1);
					goto case 1;
				case 1:
					result = 0;
					break;
				}
				return (byte)result != 0;
			}
		}

		internal Login _0024self__002435;

		public _0024Register_002431(Login self_)
		{
			_0024self__002435 = self_;
		}

		public override IEnumerator<WWW> GetEnumerator()
		{
			return new _0024(_0024self__002435);
		}
	}

	private string secretKey;

	private string formNick;

	private string formPassword;

	private string formEmail;

	private string formyzm;

	public string formText;

	public string CheckUserURL;

	public string RegisterURL;

	public string imageURL;

	public string hash;

	public bool reg;

	public GUITexture tu;

	private Rect textrect;

	public Login()
	{
		secretKey = "hashcode";
		formNick = string.Empty;
		formPassword = string.Empty;
		formEmail = "slashlee1984@hotmail.com";
		formyzm = string.Empty;
		formText = string.Empty;
		CheckUserURL = "http://fenglee.com/game/aog/checkuser.php";
		RegisterURL = "http://fenglee.com/game/aog/register.php";
		imageURL = "http://fenglee.com/game/aog/image.php";
		hash = "hashcode";
		textrect = new Rect(10f, 150f, 500f, 500f);
	}

	public virtual void Start()
	{
		StartCoroutine_Auto(LoadImage());
	}

	public virtual void OnGUI()
	{
		if (!reg)
		{
			tu.enabled = true;
			GUI.Label(new Rect(10f, 10f, 80f, 20f), "Your name:");
			GUI.Label(new Rect(10f, 30f, 80f, 20f), "Your pass:");
			GUI.Label(new Rect(10f, 50f, 80f, 20f), "yanzhengma:");
			formNick = GUI.TextField(new Rect(90f, 10f, 100f, 20f), formNick);
			formPassword = GUI.TextField(new Rect(90f, 30f, 100f, 20f), formPassword);
			formyzm = GUI.TextField(new Rect(90f, 50f, 100f, 20f), formyzm);
			if (GUI.Button(new Rect(10f, 120f, 100f, 20f), "Try login"))
			{
				StartCoroutine_Auto(Login());
			}
			if (GUI.Button(new Rect(220f, 120f, 100f, 20f), "Chanage Pic"))
			{
				StartCoroutine_Auto(LoadImage());
			}
			if (GUI.Button(new Rect(120f, 120f, 100f, 20f), "Register"))
			{
				reg = true;
			}
		}
		if (reg)
		{
			tu.enabled = false;
			GUI.Label(new Rect(10f, 10f, 80f, 20f), "Your name:");
			GUI.Label(new Rect(10f, 30f, 80f, 20f), "Your pass:");
			GUI.Label(new Rect(10f, 50f, 80f, 20f), "Your Email:");
			formNick = GUI.TextField(new Rect(90f, 10f, 100f, 20f), formNick);
			formPassword = GUI.TextField(new Rect(90f, 30f, 100f, 20f), formPassword);
			formEmail = GUI.TextField(new Rect(90f, 50f, 200f, 20f), formEmail);
			if (GUI.Button(new Rect(10f, 120f, 100f, 20f), "Login"))
			{
				reg = false;
			}
			if (GUI.Button(new Rect(120f, 120f, 100f, 20f), "Register"))
			{
				StartCoroutine_Auto(Register());
			}
		}
		GUI.TextArea(textrect, formText);
	}

	public virtual IEnumerator LoadImage()
	{
		return new _0024LoadImage_002421(this).GetEnumerator();
	}

	protected override IEnumerator _Login()
	{
		return new _0024Login_002426(this).GetEnumerator();
	}

	public virtual IEnumerator Register()
	{
		return new _0024Register_002431(this).GetEnumerator();
	}

	public virtual void Main()
	{
	}
}
