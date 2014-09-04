package cn.hanjiasongshu.jygame.controllers
{
	import com.creativebottle.starlingmvc.views.ViewManager;
	
	import cn.hanjiasongshu.jygame.events.GameEvent;
	import cn.hanjiasongshu.jygame.models.TestModel;
	
	import starling.events.EventDispatcher;
	import starling.events.Event;
	
	import cn.hanjiasongshu.jygame.views.TestView;

	public final class TestController
	{
		[Inject]
		public var _testModel : TestModel;
		
		[Inject]
		public var _viewManager : ViewManager; 
		
		[Dispatcher]
		public var _dispatcher : EventDispatcher;
		
		public function TestController()
		{
		}
		
		[PostConstruct]
		public function construct() : void
		{
			trace("game start..");
			_dispatcher.dispatchEvent(new GameEvent(GameEvent.TEST));
			//_dispatcher.dispatchEventWith(GameEvent.TEST, false, "test");
		}
		
		[EventHandler(event= "GameEvent.TEST")]
		public function test(event : GameEvent) : void
		{
			_viewManager.setView(TestView);
		}
	}
}