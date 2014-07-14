package  page
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.text.TextField;
	import numbers.Number0;
	import numbers.Number1;
	import numbers.Number2;
	import numbers.Number3;
	import numbers.Number4;
	import numbers.Number5;
	import numbers.Number6;
	import numbers.Number7;
	import numbers.Number8;
	import numbers.Number9;
	import page.DifficultSelect;
	import system.GameMainManagement;
	import system.SosuTable;
	
	public class GameMain extends MovieClip {
		//数字のムービークリップ群
		public var N0:Number0;
		public var N1:Number1;
		public var N2:Number2;
		public var N3:Number3;
		public var N4:Number4;
		public var N5:Number5;
		public var N6:Number6;
		public var N7:Number7;
		public var N8:Number8;
		public var N9:Number9;
		//問題数
		public var counter:TextField;
		private var count:int;
		private var before_Count:int = 0;
		//問題の範囲
		private var quesArea:int = GameMainManagement.quesAreaMax;
		private var quesArea_Root:int = GameMainManagement.quesAreaMin;
		//ボタン
		public var sosuButton:MovieClip;
		public var notSosuButton:MovieClip;
		//ランダムな数
		private var rndNumber:int = 2;
		private var rndNumber_Before:int = 0
		//数字表示用
		public var numberDisplay:MovieClip;
		//時間制限
		private var restTime:int = 60;
		private var frame:int = 0;
		public var time:TextField;
		//難易度
		private var Diff:int = GameMainManagement.difficult;
		//正解音
		private var seikaiSound:Sound = new SeikaiSound();
		//正解しているかどうか
		private var sosu:Boolean;
		
		public function GameMain() 
		{
			//初期化
			Init();
			//素数であるボタンが押されたかどうかのイベントリスナー
			sosuButton.addEventListener(MouseEvent.CLICK, sosuButton_clickHandler);
			//ではないボタンが押された
			notSosuButton.addEventListener(MouseEvent.CLICK, notSosuButton_clickHandler);
			//ここでタイマーの管理
			addEventListener(Event.ENTER_FRAME, enterFrame_EventHandler);
		}
		
		//初期化用メソッド
		private function Init()
		{
			/*
			//難易度による変更（これを最初にやらんとアカンですよ！もうエヴァにはのらんといてくださいよ！）
			switch(Diff)
			{
				case 0:
					{
						trace("Easy");
						quesArea = 28;
						quesArea_Root = 2;
						break;
					}
				case 1:
					{
						trace("Normal");
						quesArea = 48;
						quesArea_Root = 12;
						break;
					}
				case 2:
					{
						trace("Hard");
						quesArea = 1000
						quesArea_Root = 102;
						break;
					}
			}
			*/
			//もう一度遊ぶを押されたとき用（問題数）
			count = 1;
			//残り時間（約６０秒）
			restTime = 60;
			//問題数表示用
			counter.text = "1問目";
			//乱数生成
			rundom();
			//数字の配置
			setNumber();
		}
		
		//タイマー
		private function enterFrame_EventHandler(e:Event):void 
		{
			frame++;
			if (frame == 60)
			{
				restTime--;
				if (restTime == 0)
				{
					MovieClip(parent).gotoAndPlay("result");
				}
				time.text = "残り" + restTime.toString() + "秒";
				frame = 0;
			}
		}
		
		//素数であるボタンが押された
		private function sosuButton_clickHandler(e:MouseEvent):void 
		{	
			//正否
			if (sosu == true)
			{
				//正解音を流す
				seikaiSound.play(0, 0);
				//次の問題への準備
				gotoAndPlay("seikai");
				nextQues();
			}
			else
			{
				MovieClip(parent).gotoAndPlay("result");
			}
		}
		//ではないボタンが押された
		private function notSosuButton_clickHandler(e:MouseEvent):void 
		{
			
			//正否
			if (sosu == false)
			{
				//正解音を流す
				seikaiSound.play(0, 0);
				//次の問題への準備
				gotoAndPlay("seikai");
				nextQues();
			}
			else
			{
				MovieClip(parent).gotoAndPlay("result");
			}
		}
		
		//次の問題に移る準備
		private function nextQues()
		{
			//カウントを増やす
			count++;
			//～問目を増やす
			counter.text = count.toString() + "問目";
			//もともと表示している数字の消去
			numberDisplay.removeChildren();
			//乱数の作成
			rundom();
			//数字の設置
			setNumber();
		}
		
		//乱数作成用メソッド
		private function rundom()
		{		
			while (true)
			{
				//素数は 2~ なので底値2からとりあえず30までで。（今後レベル作成などで分ける可能性あり）
				rndNumber = Math.random() * quesArea + quesArea_Root << 0;
				//ここで数字の重複を防ぐのと素数であるかの判別を渡しておく
				if (rndNumber != rndNumber_Before)
				{
					//素数テーブルに乱数で作った数字があるか？（あれば変数sosuにtrueを入れる）
					if (SosuTable.table.hasOwnProperty(rndNumber))
					{
						sosu = true;
					}
					else
					{
						sosu = false;
					}
					rndNumber_Before = rndNumber;
					break;
				}
			}
		}
		//数字設置用
		private function setNumber()
		{
			var num:Array = [];
			//ストリング型にして扱いやすくする
			for (var i:int = 0; i < rndNumber.toString().length; i++ )
			{
				num.push(rndNumber.toString().charAt(i));
			}
			//ここで設置
			for (var i:int = 0; i < num.length; i++ )
			{
				switch(num[i])
				{
					case "0":
						{
							N0 = new Number0();
							N0.x = 200 - (50 * num.length - 1) + (100 * i);
							numberDisplay.addChild(N0);
							break;
						}
					case "1":
						{
							N1 = new Number1();
							N1.x = 200 - (50 * num.length - 1) + (100 * i);
							numberDisplay.addChild(N1);
							break;
						}
					case "2":
						{
							N2 = new Number2();
							N2.x = 200 - (50 * num.length - 1) + (100 * i);
							numberDisplay.addChild(N2);
							break;
						}
					case "3":
						{
							N3 = new Number3();
							N3.x = 200 - (50 * num.length - 1) + (100 * i);
							numberDisplay.addChild(N3);
							break;
						}
					case "4":
						{
							N4 = new Number4();
							N4.x = 200 - (50 * num.length - 1) + (100 * i);
							numberDisplay.addChild(N4);
							break;
						}
					case "5":
						{
							N5 = new Number5();
							N5.x = 200 - (50 * num.length - 1) + (100 * i);
							numberDisplay.addChild(N5);
							break;
						}
					case "6":
						{
							N6 = new Number6();
							N6.x = 200 - (50 * num.length - 1) + (100 * i);
							numberDisplay.addChild(N6);
							break;
						}
					case "7":
						{
							N7 = new Number7();
							N7.x = 200 - (50 * num.length - 1) + (100 * i);
							numberDisplay.addChild(N7);
							break;
						}
					case "8":
						{
							N8 = new Number8();
							N8.x = 200 - (50 * num.length - 1) + (100 * i);
							numberDisplay.addChild(N8);
							break;
						}
					case "9":
						{
							N9 = new Number9();
							N9.x = 200 - (50 * num.length - 1) + (100 * i);
							numberDisplay.addChild(N9);
							break;
						}
					}
					
			}
			
		}
	}
	
}

