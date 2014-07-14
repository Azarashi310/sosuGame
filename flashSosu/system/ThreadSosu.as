package  system
{
	import org.libspark.thread.Thread;
	import org.libspark.thread.EnterFrameThreadExecutor;
	import page.DifficultSelect;
	import system.SosuTable;
	/**
	 * ...
	 * @author AZARASHI
	 */
	public class ThreadSosu extends Thread
	{
		//最大出題範囲
		private var quesAreaMax:int;
		//最低出題範囲
		private var quesAreaMin:int;
		//処理した数
		public static var number:int;
		
		public function ThreadSosu() 
		{
			//Threadの初期化
			if (!Thread.isReady)
			{
				Thread.initialize(new EnterFrameThreadExecutor());
			}
		}
		//非同期処理
		override protected function run():void
		{
			//難易度の初期化
			GameMainManagement.difficultInit();
			//値の格納
			quesAreaMax = GameMainManagement.quesAreaMax;
			quesAreaMin = GameMainManagement.quesAreaMin;
			//素数だけを素数テーブルに入れる
			for (number = quesAreaMin; number < quesAreaMax; number++ )
			{
				//2~指定した素数まで
				for (var sosuMin:int = 2; sosuMin < quesAreaMax; sosuMin++ )
				{
					//途中で割りきれてしまうようなら次の数字へ
					if ((number % sosuMin) == 0)
					{
						break;
					}
					//最後まで割り切れなかったなら素数テーブルに入れる
					if (sosuMin == (quesAreaMax - 1))
					{
						SosuTable.table[number] = true;
					}
				}
			}
		}
	}

}