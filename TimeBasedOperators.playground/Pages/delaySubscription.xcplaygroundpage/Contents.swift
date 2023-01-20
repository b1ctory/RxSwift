import RxSwift

/*
 
 🐮 delaySubscription이란 단순 요소 방출을 지연시켜주는게 아니라 구독 자체를 일정 시간만큼 지연시켜주는 연산자이다.
 🐭 dueTime : 얼마동안 구독을 지연시킬 것인가?
 🐰 schedular : 해당 코드를 어떤 스레드에서 작업시킬 것인지를 정해준다.
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<Int> {
    Observable.create { observer in
        observer.onNext(1)
        observer.onNext(2)
        observer.onNext(3)
        
        return Disposables.create()
    }
}

observable().delaySubscription(.seconds(2), scheduler: MainScheduler.instance)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)


/*
 
 [결론]
 🐯 특정 Observable을 몇 초 동안 지연시켰다가 구독하고 싶으면 delaySubscription을 이용하자
 
 */
