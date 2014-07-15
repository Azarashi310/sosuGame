package page {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import page.GameMain;
	import system.GameMainManagement;
	
	public class Result extends MovieClip {
		
		//もう一回遊ぶ
		public var oneMore:MovieClip;
		//問目
		public var answerCounter:TextField;
		//コメント
		public var coment:TextField;
		public function Result() 
		{
			// constructor code
			//もういちど遊ぶボタン
			oneMore.addEventListener(MouseEvent.CLICK, oneMore_clickHandler);
			//問題数
			var count:int = GameMainManagement.quesCount - 1;
			//回答数のテキスト
			answerCounter.text = (count) + "問";
			if (count < 1)
			{
				coment.text = "は？（威圧）";
			}
			if (count < 15 && count != 0)
			{
				coment.text = "もうちょっと頑張ろう！";
			}
			else if (15 < count && count < 25)
			{
				coment.text = "やったね！よくできました！";
			}
			else if (25 < count && count < 40)
			{
				coment.text = "ここまでできれば文句なし！";
			}
			else if (40 < count && count < 60)
			{
				coment.text = "おめでとう！大体このへんが平均かな？";
			}
			else if (60 < count && count < 200)
			{
				coment.text = "gotoBeyond";
			}
			else if (100 < count && count < 500)
			{
				coment.text = "え・・・なにそれは（驚愕）";
			}
			else if (500 < count)
			{
				coment.text = "(これ以上のコメントの用意が)ないです";
			}
		}
		//もう一回遊ぶボタンがおされた
		private function oneMore_clickHandler(e:MouseEvent):void 
		{
			//gameフラグへ飛ぶ
			MovieClip(parent).gotoAndPlay("difficult");
		}
	}
	
}
