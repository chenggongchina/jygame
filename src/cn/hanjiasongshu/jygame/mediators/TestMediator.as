package cn.hanjiasongshu.jygame.mediators
{
	import cn.hanjiasongshu.jygame.views.TestView;

	public class TestMediator
	{
		public function TestMediator()
		{
			count = 0;
		}
		
		private var _view:TestView;
		
		private var count : Number;
		[ViewAdded]
		public function viewAdded(view:TestView):void
		{
			this._view = view;
			
			view._text.text = count.toString();
			count++;
			view._text.x = count * 20;
		}
		
//		[ViewRemoved]
//		public function viewRemoved(view:TestView):void
//		{
//			this._view = null;
//		}
	}
}