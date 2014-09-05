package cn.hanjiasongshu.jygame.mediators
{
	import cn.hanjiasongshu.jygame.core.assets.Assets;
	
	import starling.events.EventDispatcher;
	import cn.hanjiasongshu.jygame.models.RuntimeModel;

	public class BaseMediator
	{
		public function BaseMediator()
		{
		}
		
		[Dispatcher]
		public var _dispatcher : EventDispatcher;
		
		[Inject]
		public var _assets : Assets;
		
		[Inject]
		public var _runtimeModel : RuntimeModel;
	}
}