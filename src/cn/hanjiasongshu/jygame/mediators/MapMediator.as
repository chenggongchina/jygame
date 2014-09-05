package cn.hanjiasongshu.jygame.mediators
{
	import com.creativebottle.starlingmvc.events.EventMap;
	
	import flash.text.TextFormat;
	
	import cn.hanjiasongshu.jygame.core.factory.ComponentFactory;
	import cn.hanjiasongshu.jygame.models.MapsModel;
	import cn.hanjiasongshu.jygame.models.ResourceModel;
	import cn.hanjiasongshu.jygame.views.MapView;
	
	import feathers.controls.Button;
	import feathers.controls.ImageLoader;
	import feathers.controls.Label;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	
	import starling.display.DisplayObject;
	import starling.events.TouchEvent;
	import starling.textures.TextureSmoothing;
	import starling.events.TouchPhase; 
	

	public class MapMediator extends BaseMediator
	{
		public function MapMediator()
		{
		}
		
		[Inject]
		public var _mapsModel : MapsModel;
		
		[Inject]
		public var _resourceModel : ResourceModel;
		
		private var eventMap:EventMap = new EventMap();
		
		[ViewAdded]
		public function viewAdded(view:MapView):void
		{
			_view = view;
			
			for each(var button:Button in _view._buttons)
			{
				eventMap.addMap(button,TouchEvent.TOUCH, buttonTouched);
			}
			
			var currentBigMapXML : XML = _mapsModel.getCurrentMap();
			this.drawMap(currentBigMapXML);
		}
		
		[ViewRemoved]
		public function viewRemoved(view:MapView):void
		{
			eventMap.removeAllMappedEvents();
		}
		
		private function buttonTouched(event:TouchEvent):void
		{
			var button : Button = event.target as Button;
			if(event.touches.length == 1)
			{
				if(event.touches[0].phase == TouchPhase.BEGAN)
				{
					button.y = 10;
				}
				else if(event.touches[0].phase == TouchPhase.ENDED)
				{
					button.y = 20;
				}
			}
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
			text.pivotX = text.width / 2;
			text.pivotY = text.height / 2;
			
			text.x = location.@x;
			text.x -= 13;
			text.y = location.@y;
			text.y += 24;
			text.alignPivot();
			//text.validate();
			
			var tagImage : ImageLoader = new ImageLoader();
			
			var imageResource : String = getLocationImage(location);
			if(imageResource == null)
			{
				tagImage.source = _assets.getTexture("event_null");
			}
			else
			{
				tagImage.source = _resourceModel.getTexture(imageResource);

			}
			tagImage.height = 26;
			tagImage.width = 26;
			tagImage.pivotX = tagImage.width / 2;
			tagImage.pivotY = tagImage.height / 2;
			tagImage.x = location.@x;
			tagImage.x += 13;
			tagImage.y = location.@y;
			tagImage.y += 13;
			//tagImage.validate();
			
			tagImage.alpha = 0.7;
			
			_view._canvas.addChild(text);
			_view._canvas.addChild(tagImage);
		}
		
		private function getLocationImage(location:XML): String
		{
			for each(var evt :XML in location.event)
			{
				var img:String = evt.@image;
				if(img != null && img != "")
				{
					return img;
				}
			}
			return null;
		}
		
		/**
		 * 清空之前绘制的地图元素 
		 * 
		 */
		private function clear() : void 
		{
			_view._canvas.removeChildren();
		}
		
		private var _view : MapView;
	}
}