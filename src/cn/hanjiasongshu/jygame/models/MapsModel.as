package cn.hanjiasongshu.jygame.models
{
	import cn.hanjiasongshu.jygame.core.assets.Assets;
	import cn.hanjiasongshu.jygame.models.po.MapPO;

	/**
	 * 地图逻辑类
	 * @author cg
	 * 
	 */
	public class MapsModel
	{
		public function MapsModel()
		{
		}
		
		[Inject]
		public var _assets : Assets;
		
		[Inject]
		public var _runtimeModel : RuntimeModel;
		
		[PostConstruct]
		public function construct():void
		{
			_xml = _assets.getXml("maps");
			//trace(xmlData.maps.map.(@name=="华山后山4"));
		}
		
		/**
		 * 获取地图 
		 * @param mapName
		 * @return 
		 * 
		 */
		public function getMap(mapName : String):XML
		{
			return _xml.maps.map.(@name == mapName)[0];
		}
		
		/**
		 * 获取当前所在地图 
		 * @return 
		 * 
		 */
		public function getCurrentMap():XML
		{
			return this.getMap(_runtimeModel.currentBigMap);
		}
		
		private var _xml : XML;
	}
}