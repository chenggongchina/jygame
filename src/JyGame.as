package
{
	import com.creativebottle.starlingmvc.StarlingMVC;
	import com.creativebottle.starlingmvc.config.StarlingMVCConfig;
	import com.creativebottle.starlingmvc.views.ViewManager;
	
	import cn.hanjiasongshu.jygame.ControllerProvider;
	import cn.hanjiasongshu.jygame.MediatorProvider;
	import cn.hanjiasongshu.jygame.ModelProvider;
	
	import starling.display.Sprite;
	import starling.text.TextField;

	public class JyGame extends Sprite
	{
		private var starlingMVC:StarlingMVC;
		
		public function JyGame()
		{		
			var config:StarlingMVCConfig = new StarlingMVCConfig();
			config.eventPackages = ["cn.hanjiasongshu.jygame.events"];
			config.viewPackages = ["cn.hanjiasongshu.jygame.views"];
			
			var beans:Array = [new JyGameBeanProvider(), new ViewManager(this)];
			
			starlingMVC = new StarlingMVC(this, config, beans);
		}
	}
}