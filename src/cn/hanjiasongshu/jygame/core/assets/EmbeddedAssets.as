package cn.hanjiasongshu.jygame.core.assets
{
	public class EmbeddedAssets
	{
		//maps
		//[Embed(source="/assets/maps/daditu.jpg")]
		//public static const daditu:Class;
		
		//xmls
		[Embed(source="/assets/xml/maps.xml", mimeType="application/octet-stream")]
		public static const maps:Class;
		
		//xmls
		[Embed(source="/assets/xml/resource.xml", mimeType="application/octet-stream")]
		public static const resource:Class;
	}
}