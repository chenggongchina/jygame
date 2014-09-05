package cn.hanjiasongshu.jygame.core.assets
{
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;

	/**
	 * 资源管理类
	 * @author cg
	 * 
	 */
	public class Assets extends AssetManager
	{
		[Embed(source="/assets/images/ui.png")]
		private static const uiAtlasImage:Class;		
		[Embed(source="/assets/images/ui.xml", mimeType="application/octet-stream")]
		private static const uiAtlasXML:Class;
		
		[Embed(source="/assets/images/heads.png")]
		private static const headsAtlasImage:Class;
		[Embed(source="/assets/images/heads.xml", mimeType="application/octet-stream")]
		private static const headsAtlasXML:Class;
		
		[Embed(source="/assets/images/items.png")]
		private static const itemsAtlasImage:Class;
		[Embed(source="/assets/images/items.xml", mimeType="application/octet-stream")]
		private static const itemsAtlasXML:Class;
		
		[Embed(source="/assets/images/smallmaps.png")]
		private static const smallMapAtlasImage:Class;
		[Embed(source="/assets/images/smallmaps.xml", mimeType="application/octet-stream")]
		private static const smallMapAtlasXML:Class;
		
		public function Assets()
		{
			super();
			this.init();
		}
		
		public function init() : void
		{
			this.verbose = true;
			this.useMipMaps = false;
			
			this.addTextureAtlas("ui",  new TextureAtlas(Texture.fromBitmap(new uiAtlasImage(), false), XML(new uiAtlasXML())));
			this.addTextureAtlas("heads",  new TextureAtlas(Texture.fromBitmap(new headsAtlasImage(), false), XML(new headsAtlasXML())));
			this.addTextureAtlas("items",  new TextureAtlas(Texture.fromBitmap(new itemsAtlasImage(), false), XML(new itemsAtlasXML())));
			this.addTextureAtlas("smallmaps",  new TextureAtlas(Texture.fromBitmap(new smallMapAtlasImage(), false), XML(new smallMapAtlasXML())));
			this.enqueue(EmbeddedAssets);
		}
	}
}