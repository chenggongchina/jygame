package cn.hanjiasongshu.jygame.views
{
	import flash.text.TextFormat;
	
	import cn.hanjiasongshu.jygame.core.factory.ComponentFactory;
	
	import feathers.controls.Button;
	import feathers.controls.ImageLoader;
	import feathers.controls.Label;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class MapView extends BaseView
	{
		public function MapView()
		{
			
		}
		
		public var _background : ImageLoader;
		public var _canvas : Sprite;
		public var _buttonCanvas : Sprite;
		
		public var _zhuangtaiButton : Button;
		public var _rizhiButton : Button;
		public var _wupinButton : Button;
		public var _xitongButton : Button;
		public var _gonglueButton : Button;
		public var _juankuanButton : Button;
		
		public var _buttons : Vector.<Button> = new Vector.<Button>();
		
		public var _locateLabel : Label;
		public var _timeLabel : Label;
		
		public var _nickLabel : Label;
		public var _gameModeLabel : Label;
		public var _zhujueHead : ImageLoader;
		
		[PostConstruct]
		public function construct() : void
		{
			_background = new ImageLoader();
			_background.width = 800;
			_background.height = 600;
			_background.maintainAspectRatio = false;
			this.addChild(_background);
			
			_canvas = new Sprite();
			//_canvas.width = 800;
			//_canvas.height = 600;
			this.addChild(_canvas);
			
			_buttonCanvas = new Sprite();
			_buttonCanvas.x = 410;
			_buttonCanvas.y = 480;
			this.addChild(_buttonCanvas);
			
			//create buttons
			_zhuangtaiButton = this.addButton(0, "button_zhuangtai");
			_rizhiButton = this.addButton(1, "button_rizhi");
			_wupinButton = this.addButton(2, "button_wupin");
			_xitongButton = this.addButton(3, "button_xitong");
			_gonglueButton = this.addButton(4, "button_gonglue");
			_juankuanButton = this.addButton(5, "donate");
			
			var locationLabel : Label = ComponentFactory.getSmallFontLabel("当前位置", 0xff0000, true, 16);
			locationLabel.x = 12;
			locationLabel.y = 570;
			this.addChild(locationLabel);
			
			_locateLabel = ComponentFactory.getSmallFontLabel("大地图", 0xff0000, true, 16);
			_locateLabel.x = 84;
			_locateLabel.y = 570;
			this.addChild(_locateLabel);
			
			_timeLabel = ComponentFactory.getSmallFontLabel("江湖一年 五月初八", 0xff0000, true, 16);
			//_timeLabel.alignPivot("right");
			_timeLabel.x = 200;
			_timeLabel.y = 570;
			_timeLabel.width = 226;
			this.addChild(_timeLabel);
			
			var stateCanvas : Sprite = new Sprite();
			stateCanvas.x = 23;
			stateCanvas.y = 18;
			this.addChild(stateCanvas);
			
			var stateBackground : ImageLoader = new ImageLoader();
			stateBackground.source = _assets.getTexture("nick");
			stateBackground.x = 0;
			stateBackground.y = -12;
			stateBackground.width = 200;
			stateBackground.height = 70;
			stateCanvas.addChild(stateBackground);
			
			_nickLabel = ComponentFactory.getSmallFontLabel("初出茅庐", 0xEF5E00, true, 20);
			_nickLabel.x = 62;
			_nickLabel.y = -4;
			stateCanvas.addChild(_nickLabel);
			
			_gameModeLabel = ComponentFactory.getSmallFontLabel("难度：普通");
			_gameModeLabel.x = 61;
			_gameModeLabel.y = 24;
			stateCanvas.addChild(_gameModeLabel);
			
			_zhujueHead = new ImageLoader();
			_zhujueHead.x = 4;
			_zhujueHead.y = -4;
			_zhujueHead.width = 40;
			_zhujueHead.height = 49;
			_zhujueHead.source = _assets.getTexture("zhujue");
			stateCanvas.addChild(_zhujueHead);
		}
		
		private function addButton(index:Number, textureName:String) : Button
		{
			var button : Button = new Button();
			button.defaultSkin = new Image(_assets.getTexture(textureName));
			button.x = index * 63;
			button.y = 20;
			button.width = 60;
			button.height = 85;
			_buttonCanvas.addChild(button);
			_buttons.push(button);
			return button;
		}
	}
}