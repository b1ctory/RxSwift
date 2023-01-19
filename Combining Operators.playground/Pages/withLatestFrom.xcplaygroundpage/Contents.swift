import RxSwift

/*
 
 🦑 withLatestFrom은 다른 Observable에서 이벤트가 방출됨에 따라 이벤트를 방출시켜주는 연산자이다.
 🦁 trigger Observable에서 요소가 방출될 때마다 target Observable에서 가장 최근에 방출되었던 요소를 전달해준다.
 🐱 trigger Observable에서 방출되는 요소가 일종의 트리거 역할인 것이다.
 🦖 trigger Observable에서 어떤 요소가 방출되었는지가 중요한 것이 아닌 요소가 방출되었는지 자체가 더 중요하기 때문에 요소의 타입이 달라도 상관 없다!
 
 */

let disposeBag = DisposeBag()

let trigger = PublishSubject<String>()
let ballType = PublishSubject<String>()

trigger.withLatestFrom(ballType)
    .subscribe(onNext: { element in
        print("\(element) 발사!")
    }).disposed(by: disposeBag)

ballType.onNext("빨간공")
ballType.onNext("파란공")
ballType.onNext("파란공")
ballType.onNext("초록공")
ballType.onNext("노란공")

/*
 
 🐬 withLatestFrom은 trigger Observable에서 요소가 방출이 되어야 bullet Observable에서 방출되었던 가장 최신 요소가 구독자에게 전달되게 되는 것이다.
 🦄 따라서 ballType.onNext("노란공") 은 그저 색깔 공을 장전해 준 것!
 
 */

// 🐧 트리거에 요소를 방출시키면 노란공 발사! 출력
trigger.onNext("발사!")

/*
 
 🦀 버튼과 액션에 활용할 수 있다.
 🦊 텍스트를 입력할 수 있는 UITextField와 입력한 내용을 보낼 수 있는 UIButton이 존재한다고 가정했을 때,
 🐤 UITextField를 발사될 것 / 그리고 UIButton을 방아쇠 라고 생각하면 된다.
 🐍 사용자가 UITextField에 내용을 입력하고서 UIButton에서 tap이라는 이벤트 요소를 발생시키면 UITextField에 작성된 내용을 가지고 구독자에게 처리를 요청할 수 있다.
 
 [결론]
 🐯 한 Observable에서 요소가 방출됨에 따라서 다른 Observable에서 가장 최근에 방출되었던 요소를 구독자에게 전달하고 싶다면 withLatestFrom을 사용!
 
 */
