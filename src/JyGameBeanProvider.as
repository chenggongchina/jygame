package
{
	import com.creativebottle.starlingmvc.beans.BeanProvider;
	
	import cn.hanjiasongshu.jygame.controllers.TestController;
	import cn.hanjiasongshu.jygame.mediators.TestMediator;
	import cn.hanjiasongshu.jygame.models.TestModel;

	public class JyGameBeanProvider extends BeanProvider
	{
		public function JyGameBeanProvider()
		{
			beans = [
				//models
				new TestModel(),
				
				//mediators
				new TestMediator(),
				
				//controllers
				new TestController(),
			];
		}
	}
}