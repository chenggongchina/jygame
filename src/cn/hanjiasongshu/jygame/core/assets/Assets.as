package cn.hanjiasongshu.jygame.core.assets
{
	import starling.utils.AssetManager;

	/**
	 * 资源管理类
	 * @author cg
	 * 
	 */
	public class Assets extends AssetManager
	{
		public function Assets()
		{
			super();
			this.init();
		}
		
		public function init() : void
		{
			verbose = true;
			this.enqueue(EmbeddedAssets);
		}
	}
}