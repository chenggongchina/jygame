package cn.hanjiasongshu.jygame.views
{
	import cn.hanjiasongshu.jygame.core.assets.Assets;
	
	import starling.display.Sprite;

	public class BaseView extends Sprite
	{
		public function BaseView()
		{
		}
		
		[Inject]
		public var _assets : Assets;
	}
}