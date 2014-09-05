package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import feathers.themes.AeonDesktopTheme;
	
	import starling.core.Starling;
	
	[SWF(width="800", height="600", frameRate="60", backgroundColor="#ffffff")]
	public class Main extends Sprite
	{
		private var _starling:Starling;
		
		
		public function Main()
		{
			super();
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddToStageHandler);
		}
		
		protected function onAddToStageHandler(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddToStageHandler);
			
			Starling.handleLostContext = true;
			_starling = new Starling(JyGame, stage);
			_starling.stage3D.addEventListener(Event.CONTEXT3D_CREATE, 
				function(event:Event):void 
				{
					//init feather theme
					//new AeonDesktopTheme();
					
					_starling.showStats = true;
					_starling.start();
				}
			);
		}

	}
}