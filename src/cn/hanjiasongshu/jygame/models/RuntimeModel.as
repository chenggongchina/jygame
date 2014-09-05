package cn.hanjiasongshu.jygame.models
{
	import flash.utils.Dictionary;

	/**
	 * 描述所有当前游戏运行数据
	 * @author cg
	 * 
	 */
	public class RuntimeModel
	{
		public function RuntimeModel()
		{
			_data = new Dictionary();
			
		}
		
		private var _data : Dictionary;
		
		//当前地图位置
		public function get currentBigMap():String
		{
			return getDataOrInit("currentBigMap");
		}

		public function set currentBigMap(value:String):void
		{
			_data["currentBigMap"] = value;
		}

		
		/**
		 * 获取一个数据，如果是空的，则构造 
		 * @param key
		 * @param initValue 初始值
		 * @return 
		 * 
		 */
		private function getDataOrInit(key: String, initValue:String = "") : String
		{
			if(_data[key] == null)
			{
				_data[key] = initValue;
			}
			return _data[key];
		}
	}
}