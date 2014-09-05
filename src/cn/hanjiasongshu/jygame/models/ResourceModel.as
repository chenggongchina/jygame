package cn.hanjiasongshu.jygame.models
{
	import cn.hanjiasongshu.jygame.core.assets.Assets;
	import cn.hanjiasongshu.jygame.utils.StringUtil;
	import starling.textures.Texture;

	public class ResourceModel
	{
		public function ResourceModel()
		{
		}
		
		[Inject]
		public var _assets : Assets;
		
		[PostConstruct]
		public function construct():void
		{
			_xml = _assets.getXml("resource");
		}
		
		public function getValue(key : String) : String
		{
			var rst:XML = _xml.resource.(@key == key)[0]; 
			return rst.@value;
		}
		
		public function getTexture(key : String) : Texture
		{
			var value :String = getValue(key);
			var rst :String = null;
			rst =value
				.replace(".jpg","")
				.replace(".png","")
				.replace("/Resource/maps/","smallmap/")
				.replace("/Resource/heads/","")
				.replace("/Resource/items/","");
			return _assets.getTexture(rst);
		}
		
		private var _xml : XML;
	}
}