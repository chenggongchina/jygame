package cn.hanjiasongshu.jygame.controllers
{
	import com.creativebottle.starlingmvc.views.ViewManager;
	
	import starling.events.EventDispatcher;
	import cn.hanjiasongshu.jygame.core.assets.Assets;

	/**
	 * 控制器基类
	 * @author cg
	 * 
	 */
	public class BaseController
	{
		public function BaseController()
		{
		}
		
		[Dispatcher]
		public var _dispatcher : EventDispatcher;
		
		[Inject]
		public var _viewManager : ViewManager; 
		
		[Inject]
		public var _assets : Assets;
	}
}