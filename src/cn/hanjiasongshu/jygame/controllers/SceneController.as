package cn.hanjiasongshu.jygame.controllers
{
	import flash.utils.setTimeout;
	
	import cn.hanjiasongshu.jygame.events.GameEvent;
	import cn.hanjiasongshu.jygame.views.MainMenuView;
	import cn.hanjiasongshu.jygame.views.MapView;
	import cn.hanjiasongshu.jygame.models.RuntimeModel;

	public class SceneController extends BaseController
	{
		public function SceneController()
		{
		}
		
		[Inject]
		public var _mainMenuView : MainMenuView;
		
		[Inject]
		public var _mapView : MapView;
		
		[Inject]
		public var _runtimeModel : RuntimeModel;
		
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
			_viewManager.addView(_mainMenuView);
		}
		
		[EventHandler(event= "GameEvent.NEW_GAME") , properties="data"]
		public function newGame(data : String) : void
		{
			trace("new game called");
			_runtimeModel.currentBigMap = "大地图";
			
			_viewManager.removeAll();
			_viewManager.addView(_mapView);
		}
	}
}