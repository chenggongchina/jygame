package cn.hanjiasongshu.jygame.core.factory
{
	import flash.text.TextFormat;
	
	import feathers.controls.Label;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;

	public class ComponentFactory
	{	
		public static function getSmallFontLabel(
			text: String = "" , 
			color : Number = 0xff0000,
			isBold : Boolean = true,
			fontSize : Number = 11,
			font : String = "SimHei"
		) : Label
		{
			var label : Label = new Label();
			label.text = text;
			label.textRendererFactory = function():ITextRenderer
			{
				var textRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				textRenderer.textFormat = new TextFormat( font, fontSize, color, isBold );
				return textRenderer;
			}
			return label;
		}
	}
}