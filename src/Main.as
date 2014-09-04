package
{
	import flash.display.Sprite;
	import flash.utils.setTimeout;
	import starling.core.Starling;
	
	public class Main extends Sprite
	{
		private var _starling:Starling;
		
		[SWF(width="800", height="600", frameRate="60", backgroundColor="#000000")]
		public function Main()
		{
			setTimeout(startGame , 100);
		}
		
		private function startGame():void{

			_starling = new Starling(JyGame, stage);
			_starling.start();
		}
	}
}