package page {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import system.GameMainManagement;
	import system.ThreadSosu;
	import flash.net.URLLoader;
	import numbers.SosuTable;
	
	public class Loading extends MovieClip {
		//パーセント表記
		public var parsent:TextField;
		//素数を作る数
		// public static var maxSosu:int = 2000;
		
		public function Loading() 
		{
			// constructor code
			//早いと気持ち悪いので
			// stage.frameRate = 30;
			//非同期処理メソッド
			// var ThreadWork:ThreadSosu = new ThreadSosu();
			//非同期処理の開始
			// ThreadWork.start();
			//これでロードの進行度を表示するのと素数を作る
			// addEventListener(Event.ENTER_FRAME, enterframe_eventHandler);
			
			// 外部ファイルから素数の解答をロード
			trace( SosuTable.isPrime( 12 ) );
			trace( SosuTable.isPrime( 15 ) );
			trace( SosuTable.isPrime( 17 ) );
			trace( SosuTable.isPrime( 19 ) );
			trace( SosuTable.isPrime( 20 ) );
			
		}
		//ロードの進行度
		//private function enterframe_eventHandler(e:Event):void 
		//{
			//var Par:int = GameMainManagement.quesAreaMax / (ThreadSosu.number / 100);
			//parsent.text = Par.toString() + "%";
		//}
	}
}
