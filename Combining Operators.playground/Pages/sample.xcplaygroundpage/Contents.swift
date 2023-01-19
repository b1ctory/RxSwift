import RxSwift

/*
 
 🌷 sample은 withLatestFrom과 동일하지만 첫 요소만 구독자에게 전달해준다는 점에서 다르다.
 
 */

let disposeBag = DisposeBag()

let trigger = PublishSubject<String>()
let target = PublishSubject<Int>()

target.sample(trigger)
    .subscribe(onNext: { element in
        print("\(element) 방출됨")
    }).disposed(by: disposeBag)

target.onNext(1)
target.onNext(2)
target.onNext(3)

trigger.onNext("Bang") // 3 방출됨
trigger.onNext("Bang")

target.onNext(4)
trigger.onNext("Bang")

/*
 
 [결론]
 🐯 trigger Observable에 의해서 다른 Observable에서 방출된 가장 최신값을 구독자에게 전달하되 한 번으로 제한하고 싶다면 sample을 사용하도록 하자!
 
 */
