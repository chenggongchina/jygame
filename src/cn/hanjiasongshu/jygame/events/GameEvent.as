package cn.hanjiasongshu.jygame.events
{
	import starling.events.Event;

	public final class GameEvent extends Event
	{
		
		public static const TEST:String = "evt_test";
		
		public function GameEvent(type:String, bubbles:Boolean = false, data:Object = null)
		{
			super(type, bubbles, data);
		}
		
	}
}