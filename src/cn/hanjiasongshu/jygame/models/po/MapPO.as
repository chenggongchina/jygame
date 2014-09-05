package cn.hanjiasongshu.jygame.models.po
{
	public class MapPO
	{
		public function MapPO()
		{
			
		}
		
		public var name : String;
		public var pic : String;
		
		public var locations : Vector.<MapLocationPO>;
		public var musics : Vector.<MusicPO>;
		public var mapRole : Vector.<MapRolePO>;
	}
}