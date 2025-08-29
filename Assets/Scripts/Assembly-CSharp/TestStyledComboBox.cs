using UnityEngine;

public class TestStyledComboBox : MonoBehaviour
{
	public StyledComboBox comboBox;

	private void Start()
	{
		comboBox.AddItems("English", "\u7B80\u4F53\u4E2D\u6587"/*"简体中文"*/, "\u7E41\u9AD4\u4E2D\u6587"/*"繁體中文"*/, "\u7E41\u9AD4\u4E2D\u6587"/*"繁體中文"*/, "\u7E41\u9AD4\u4E2D\u6587"/*"繁體中文"*/, "\u7E41\u9AD4\u4E2D\u6587"/*"繁體中文"*/, "\u7E41\u9AD4\u4E2D\u6587"/*"繁體中文"*/, "\u7E41\u9AD4\u4E2D\u6587"/*"繁體中文"*/, "\u7E41\u9AD4\u4E2D\u6587"/*"繁體中文"*/, "\u7E41\u9AD4\u4E2D\u6587"/*"繁體中文"*/, "\u7E41\u9AD4\u4E2D\u6587"/*"繁體中文"*/);
	}
}
