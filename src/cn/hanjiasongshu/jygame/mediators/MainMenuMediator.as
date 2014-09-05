package cn.hanjiasongshu.jygame.mediators
{
	import cn.hanjiasongshu.jygame.events.GameEvent;
	import cn.hanjiasongshu.jygame.views.MainMenuView;
	
	import feathers.data.ListCollection;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class MainMenuMediator extends BaseMediator
	{
		public function MainMenuMediator()
		{
		}
		
		[ViewAdded]
		public function viewAdded(view:MainMenuView):void
		{
			_view = view;
			_view._btnGroup.dataProvider = new ListCollection(
				[
					{ label: "新的开始", triggered: function() : void { _dispatcher.dispatchEventWith(GameEvent.NEW_GAME, true, null); } },
					{ label: "旧的回忆", triggered: function() : void {} },
					{ label: "游戏设置", triggered: function() : void {} },
					{ label: "MOD专区", triggered: function() : void {} },
					{ label: "音乐欣赏", triggered: function() : void {} },
					{ label: "资助我们", triggered: function() : void {} },
					{ label: "制作组", triggered: function() : void {} },
				]);
		}
		
		private var _view : MainMenuView;
	}
}