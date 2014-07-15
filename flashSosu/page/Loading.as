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
			
			// 外部ファイルから素数の解答をロード
			trace( SosuTable.isPrime( 12 ) );
			trace( SosuTable.isPrime( 15 ) );
			trace( SosuTable.isPrime( 17 ) );
			trace( SosuTable.isPrime( 19 ) );
			trace( SosuTable.isPrime( 20 ) );
			
		}
	}
}
