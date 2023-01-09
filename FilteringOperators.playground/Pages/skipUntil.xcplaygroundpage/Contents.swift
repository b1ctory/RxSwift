import RxSwift

/*
 
 😡 skipUntil이란 말 그대로 "~할 때까지 스킵해라!"는 의미를 지닌 연산자이다.
 🤬 skipUntil은 파라메터로 다른 Observable을 받고 있는데, 이 파라메터로 받은 Observable에서 이벤트가 방출되면 그제서야 요소를 전달받는 형식인 것이다.
 
 */

let disposeBag = DisposeBag()

let observable = PublishSubject<Int>()
let trigger = PublishSubject<Any>()

observable.skip(until: trigger)
    .subscribe(onNext: { element in
        print("\(element)가 방출됨")
    }).disposed(by: disposeBag)

observable.onNext(1)
observable.onNext(2)
trigger.onNext("빵야빵야🔫")
observable.onNext(3)
observable.onNext(4)
observable.onNext(5)

/*
 [출력 결과]
 3가 방출됨
 4가 방출됨
 5가 방출됨

 🧸 trigger에서 어떤 요소가 방출되었는지는 별로 중요하지 않다.
 💌 그저 요소가 방출되었다는 사실이 더 중요하다.
 
 [결론]
 🐯 다른 Trigger 역할을 하는 Observable에서 요소가 방출된 이후에 현재 Observable에서 방출되는 요소들을 구독자에게 전달하고 싶다면 skipUntil을 사용하자
 🐯 Trigger의 역할을 하는 Observable에서 방출되는 요소의 정체는 그렇게 중요하지 않고, Trigger의 Observable에서 요소가 방출되었다는 사실이 skipUntil 에서는 더 중요하다.
 */
