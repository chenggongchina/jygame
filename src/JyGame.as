package
{
	import com.creativebottle.starlingmvc.StarlingMVC;
	import com.creativebottle.starlingmvc.config.StarlingMVCConfig;
	import com.creativebottle.starlingmvc.views.ViewManager;
	
	import starling.display.Sprite;
	import starling.errors.AbstractClassError;
	import cn.hanjiasongshu.jygame.core.assets.Assets;

	/**
	 * 
	 * @author cg
	 * 
	 */
	public class JyGame extends Sprite
	{
		private var starlingMVC:StarlingMVC;
		
		public function JyGame()
		{		
			var config:StarlingMVCConfig = new StarlingMVCConfig();
			config.eventPackages = ["cn.hanjiasongshu.jygame.events"];
			config.viewPackages = ["cn.hanjiasongshu.jygame.views"];
			
			var assets:Assets = new Assets();
			var gameSprite : Sprite = this;
			
			assets.loadQueue(
				function(ratio:Number):void
				{
					trace("loading assets, ratio = " + ratio);
					if (ratio == 1.0){
						var beans:Array = [assets, new JyGameBeanProvider(), new ViewManager(gameSprite)];
						starlingMVC = new StarlingMVC(gameSprite, config, beans);
					}
				}
			);
			
		}
	}
}