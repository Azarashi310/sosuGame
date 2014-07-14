package page {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import system.GameMainManagement;
	
	
	public class DifficultSelect extends MovieClip {
		
		//かんたん
		public var easyButton:MovieClip;
		//ふつう
		public var normalButton:MovieClip;
		//むずかしい
		public var hardButton:MovieClip;
		//素数ってなに
		public var howToSosu:MovieClip;
		
		//何がセレクトされたかの値
		//public static var Diff:int = 0;
		
		public function DifficultSelect() {
			// constructor code
			//簡単
			easyButton.addEventListener(MouseEvent.CLICK, difficultButton_clickHandler);
			//普通
			normalButton.addEventListener(MouseEvent.CLICK, difficultButton_clickHandler);
			//難しい
			hardButton.addEventListener(MouseEvent.CLICK, difficultButton_clickHandler);
			//素数
			howToSosu.addEventListener(MouseEvent.CLICK, howToSosu_clickHandler);
		}
		/*
		//かんたんボタンが押された
		private function easyButton_clickHandler(e:MouseEvent):void 
		{
			//選択した難易度
			GameMainManagement.difficult = 0;
			//ローディング画面へ飛ばす
			MovieClip(parent).gotoAndPlay("Init");
		}
		//ふつうボタンが押された
		private function normalButton_clickHandler(e:MouseEvent):void 
		{
			GameMainManagement.difficult = 1;
			MovieClip(parent).gotoAndPlay("Init");
		}
		//むずかしいボタンが押された
		private function hardButton_clickHandler(e:MouseEvent):void 
		{
			GameMainManagement.difficult = 2;
			MovieClip(parent).gotoAndPlay("Init");
		}
		*/
		//難易度選択ボタンが押された
		private function difficultButton_clickHandler(e:MouseEvent):void 
		{
			//押されたボタンの種別
			switch(e.currentTarget)
			{
				//簡単
				case easyButton:
					{
						GameMainManagement.difficult = 0;
						break;
					}
				//普通
				case normalButton:
					{
						GameMainManagement.difficult = 1;
						break;
					}
				//難しい
				case hardButton:
					{
						GameMainManagement.difficult = 2;
						break;
					}
			}
			MovieClip(parent).gotoAndPlay("Init");
		}
		//howToSosuボタンが押された
		private function howToSosu_clickHandler(e:MouseEvent):void 
		{
			gotoAndPlay("sosu");
		}
	}
	
}
