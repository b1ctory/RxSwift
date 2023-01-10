import RxSwift

/*
 
 🐧 다른 Trigger Observable이 요소를 방출하기 전까지 take 하도록 도와주는 연산자
 🐝 skipUntil은 Trigger에서 요소가 방출되기 직전까지 이벤트를 스킵한 반면 takeUntil은 Trigger에서 요소가 방출되기 직전까지만 이벤트를 take 한다.
 
 */

let disposeBag = DisposeBag()

let observable = PublishSubject<Int>()
let trigger = PublishSubject<Any>()

observable.take(until: trigger)
    .subscribe(onNext: { element in
        print("\(element) 방출됨")
    }).disposed(by: disposeBag)

observable.onNext(1)
observable.onNext(2)
trigger.onNext("bang!")
observable.onNext(3)
observable.onNext(4)
observable.onNext(5)

/*
 [결론]
 🐯 Trigger 역할의 Observable이 요소를 방출한 순간 현재 Observable의 요소 전달을 멈추고싶을 때 takeUntil을 사용하자
 */
