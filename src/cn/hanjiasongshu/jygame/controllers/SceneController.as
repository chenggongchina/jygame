package cn.hanjiasongshu.jygame.controllers
{
	import com.creativebottle.starlingmvc.views.ViewManager;
	
	import cn.hanjiasongshu.jygame.events.GameEvent;
	import cn.hanjiasongshu.jygame.views.MainMenuView;
	
	import starling.events.EventDispatcher;

	public class SceneController
	{
		public function SceneController()
		{
		}
		
		[Dispatcher]
		public var _dispatcher : EventDispatcher;
		
		[Inject]
		public var _viewManager : ViewManager; 
		
		[PostConstruct]
		public function construct() : void
		{
			//游戏载入完成，跳转到主界面
			_dispatcher.dispatchEventWith(GameEvent.MAIN_MENU, false, null);
		}
		
		[EventHandler(event= "GameEvent.MAIN_MENU") , properties="data"]
		public function mainMenu(data : String) : void
		{
			trace("main menu showed");
			_viewManager.setView(MainMenuView);
		}
		
		[EventHandler(event= "GameEvent.NEW_GAME") , properties="data"]
		public function newGame(data : String) : void
		{
			trace("new game called");
		}
	}
}