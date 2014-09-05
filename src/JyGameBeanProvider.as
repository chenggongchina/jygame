package
{
	import com.creativebottle.starlingmvc.beans.BeanProvider;
	
	import cn.hanjiasongshu.jygame.controllers.SceneController;
	import cn.hanjiasongshu.jygame.mediators.MainMenuMediator;
	import cn.hanjiasongshu.jygame.mediators.MapMediator;
	import cn.hanjiasongshu.jygame.models.RuntimeModel;
	import cn.hanjiasongshu.jygame.views.MainMenuView;
	import cn.hanjiasongshu.jygame.views.MapView;
	import cn.hanjiasongshu.jygame.models.MapsModel;
	import cn.hanjiasongshu.jygame.models.ResourceModel;

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
				new RuntimeModel(),
				new MapsModel(),
				new ResourceModel(),
				
				//mediators
				new MainMenuMediator(),
				new MapMediator(),
				
				//controllers
				new SceneController(),
				
				//views
				new MainMenuView(),
				new MapView(),
			];
		}
	}
}