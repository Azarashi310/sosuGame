package system
{
	/**
	 * ...
	 * @author AZARASHI
	 */
	public class GameMainManagement 
	{
		//最大出題範囲
		public static var quesAreaMax:int;
		//最低出題範囲
		public static var quesAreaMin:int;
		//選択された難易度
		public static var difficult:int;
		//回答した問題数
		public static var quesCount:int;
		
		public function GameMainManagement() 
		{
			
		}
		
		//難易度
		public static function difficultInit():void
		{
			//難易度による変更（これを最初にやらんとアカンですよ！もうエヴァにはのらんといてくださいよ！）
			switch(difficult)
			{
				case 0:
					{
						trace("Easy");
						quesAreaMax = 20;
						quesAreaMin = 2;
						break;
					}
				case 1:
					{
						trace("Normal");
						quesAreaMax = 48;
						quesAreaMin = 12;
						break;
					}
				case 2:
					{
						trace("Hard");
						quesAreaMax = 1000
						quesAreaMin = 102;
						break;
					}
			}
			trace("quesAreaMax :" + quesAreaMax);
			trace("quesAreaMin :" + quesAreaMin);
			trace("difficult :" + difficult);
			trace("quesCount :" + quesCount);
		}
	}

}