package cn.hanjiasongshu.jygame.mediators
{
	import flash.text.TextFormat;
	
	import cn.hanjiasongshu.jygame.models.MapsModel;
	import cn.hanjiasongshu.jygame.views.MapView;
	import cn.hanjiasongshu.jygame.core.factory.ComponentFactory;
	
	import feathers.controls.Label;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	
	import starling.display.DisplayObject;
	

	public class MapMediator extends BaseMediator
	{
		public function MapMediator()
		{
			_dynamicChilds = new Vector.<DisplayObject>;	
		}
		
		[Inject]
		public var _mapsModel : MapsModel;
		
		[ViewAdded]
		public function viewAdded(view:MapView):void
		{
			_view = view;
			var currentBigMapXML : XML = _mapsModel.getCurrentMap();
			this.drawMap(currentBigMapXML);
		}
		
		/**
		 * 绘制地图 
		 * @param map
		 * 
		 */
		private function drawMap(map : XML) : void
		{		
			//clear map elements
			this.clear();
			
			//draw background
			_view._background.source = _assets.getTexture("daditu");
			
			//draw locations
			for each(var location:XML in map.location)
			{
				this.addLocation(location);
			}
		}
		
		/**
		 * 添加一个地点 
		 * @param location
		 * 
		 */
		private function addLocation(location: XML): void
		{
			var text : Label  = ComponentFactory.getSmallFontLabel();
			text.text = location.@name;
			text.x = location.@x;
			text.y = location.@y;

			_dynamicChilds.push(text);
			_view.addChild(text);
		}
		
		/**
		 * 清空之前绘制的地图元素 
		 * 
		 */
		private function clear() : void 
		{
			for each(var child : DisplayObject in _dynamicChilds)
			{
				_view.removeChild(child);
			}
			
			_dynamicChilds.length = 0;
		}
		
		private var _dynamicChilds : Vector.<DisplayObject>;
		
		private var _view : MapView;
	}
}