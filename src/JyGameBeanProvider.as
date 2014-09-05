package
{
	import com.creativebottle.starlingmvc.beans.BeanProvider;
	import cn.hanjiasongshu.jygame.controllers.SceneController;
	import cn.hanjiasongshu.jygame.mediators.MainMenuMediator;

	/**
	 * bean provider
	 * @author cg
	 * 
	 */
	public class JyGameBeanProvider extends BeanProvider
	{
		public function JyGameBeanProvider()
		{
			beans = [				
				//models

				//mediators
				new MainMenuMediator(),
				
				//controllers
				new SceneController(),
			];
		}
	}
}