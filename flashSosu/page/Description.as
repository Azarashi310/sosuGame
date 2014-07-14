package page {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Description extends MovieClip {
		
		//次へボタン
		//public var nextFrameButton:MovieClip;
		//タイトルへボタン
		public var goToTitleButton:MovieClip;
		
		public function Description() {
			// constructor code
			//次へボタンが押されたとき用のやつ
			nextFrameButton.addEventListener(MouseEvent.CLICK, NF_Button_clickHandler);
			//タイトルへボタンが押された時のようのやつ
			goToTitleButton.addEventListener(MouseEvent.CLICK, GT_Button_clickHandler);
			
			//説明の時だけ遅くしたいのでfps30へ変更
			stage.frameRate = 30;
		}
		
		//次へボタン
		private function NF_Button_clickHandler(e:MouseEvent):void 
		{
			this.play();
		}
		
		//タイトルへボタン
		private function GT_Button_clickHandler(e:MouseEvent):void 
		{
			//フレームレートを戻さないと面倒なのでここで直します
			stage.frameRate = 60;
			MovieClip(root).gotoAndPlay("title");
		}
		
	}
	
}
