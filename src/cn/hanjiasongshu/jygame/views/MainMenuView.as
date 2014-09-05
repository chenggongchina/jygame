package cn.hanjiasongshu.jygame.views
{
	import flash.text.TextFormat;

	import feathers.controls.Button;
	import feathers.controls.ButtonGroup;
	import feathers.controls.Label;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	
	import starling.display.Image;
	import starling.textures.Texture;

	public class MainMenuView extends BaseView
	{
		public function MainMenuView()
		{
			
		}
		
		public var _btnGroup : ButtonGroup;
		
		[PostConstruct]
		public function construct() : void
		{
			var t : Texture = _assets.getTexture("mainmenu");
			var background : Image = new Image(t);
			background.width = 800;
			background.height = 600;
			this.addChild(background);
			
			_btnGroup = new ButtonGroup();
			this.addChild(_btnGroup);
			_btnGroup.x = 500;
			_btnGroup.y = 200;
			_btnGroup.direction = ButtonGroup.DIRECTION_VERTICAL;
			_btnGroup.gap = 10;
			_btnGroup.buttonFactory = function():Button
			{
				var button:Button = new Button();
				button.defaultSkin = new Image( _assets.getTexture("cao-1") );
				button.downSkin = new Image( _assets.getTexture("cao-2") );
				button.labelFactory = function():ITextRenderer
				{
					var textRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
					textRenderer.textFormat = new TextFormat( "SimHei", 22, 0xffffff );
					return textRenderer;
				}
				button.width = 250;
				button.alpha = 0.8;
				return button;
			};
			
			var title : Label = new Label();
			title.text = "金庸群侠传X";
			title.textRendererFactory = function():ITextRenderer
			{
				var textRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				textRenderer.textFormat = new TextFormat( "SimHei", 40, 0xD808FB, true );
				return textRenderer;
			}
			title.x = 100;
			title.y = 50;
			this.addChild(title);
			
			var versionInfo : Label = new Label();
			versionInfo.text = "BETA V0.6";
			versionInfo.textRendererFactory = function():ITextRenderer
			{
				var textRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				textRenderer.textFormat = new TextFormat( "SimHei", 15, 0x00A2FF, true );
				return textRenderer;
			}
			versionInfo.x = 200;
			versionInfo.y = 110;
			this.addChild(versionInfo);
		}
	}
}