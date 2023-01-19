import RxSwift

/*
 
 👠 amb는 ambiguous의 약어이다. amb는 여러 Observable을 구독하고 있다가 먼저 요소가 방출되는 Observable을 채택하고 나머지는 무시하도록 도와주는 연산자이다.
 
 */
let disposeBag = DisposeBag()

let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

left.amb(right)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

left.onNext(0)
right.onNext(100)
right.onNext(200)
right.onNext(300)

/*
 
 👑 left에서 요소를 한번 방출시키고 나니 right에서 아무리 요소를 방출시켜도 구독자에게 전달되지 않는다.
 🧢 그리고 amb도 예외없이 Observable에서 방출시켜줄 요소의 타입이 동일해야 컴파일 에러가 안난다!
 👒 API를 호출할 수 있는 서버 A, B가 있다고 할 때 A 서버에 트래픽이 몰리는 경우 트래픽이 덜 몰려있는 B 서버가 더 빠를 것이다. 이런 경우에 두 서버에 API를 통해 데이터 요청을 보내서 데이터가 먼저 도착하는 쪽의 API를 선택하는 식을 구현할 수 있다.
 
 [결론]
 🐯 둘 중 먼저 요소가 방출되는 Observable을 채택하고 나머지 Observable은 사용 안하겠다 하는 경우 amb를 사용!
 
 */
