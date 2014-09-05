package cn.hanjiasongshu.jygame.views
{
	import flash.text.TextFormat;
	
	import feathers.controls.ImageLoader;
	import feathers.controls.Label;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	
	import starling.display.DisplayObject;

	public class MapView extends BaseView
	{
		public function MapView()
		{
			
		}
		
		public var _background : ImageLoader;
		
		[PostConstruct]
		public function construct() : void
		{
			_background = new ImageLoader();
			_background.width = 800;
			_background.height = 600;
			
			this.addChild(_background);
		}
	}
}