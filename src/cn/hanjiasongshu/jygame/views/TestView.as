package cn.hanjiasongshu.jygame.views
{
	import starling.display.Sprite;
	import starling.text.TextField;

	public class TestView extends Sprite
	{
		
		public function TestView()
		{
		}
		
		[PostConstruct]
		public function constrcut():void
		{
			_text = new TextField(400, 300, "Welcome to Starling!");
			addChild(_text);
		}
		
		public var _text : TextField;
	}
}