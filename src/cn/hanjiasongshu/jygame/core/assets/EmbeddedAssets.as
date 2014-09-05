package cn.hanjiasongshu.jygame.core.assets
{
	public class EmbeddedAssets
	{
		//ui elements
		[Embed(source="/assets/ui/mainmenu.jpg")]
		public static const mainmenu:Class;
		[Embed(source="/assets/ui/skillbox.png")]
		public static const skillbox:Class;
		[Embed(source="/assets/ui/info.png")]
		public static const info:Class;
		[Embed(source="/assets/ui/cao1.png")]
		public static const cao1:Class;
		[Embed(source="/assets/ui/cao2.png")]
		public static const cao2:Class;
		[Embed(source="/assets/ui/cao3.png")]
		public static const cao3:Class;
		[Embed(source="/assets/ui/caofill.png")]
		public static const caofill:Class;
		
		//maps
		[Embed(source="/assets/maps/daditu.jpg")]
		public static const daditu:Class;
		
		//xmls
		[Embed(source="/assets/xml/maps.xml", mimeType="application/octet-stream")]
		public static const maps:Class;
	}
}