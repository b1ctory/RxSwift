import RxSwift

/*
 
 🐤 delay는 Observable에서 방출되는 요소를 원하는 시간만큼 지연시켰다가 방출시키도록 도와주는 연산자입니다. 다만, 각 요소마다 지연시켜주는 것은 아니고 첫 요소에 대해서만 적용된다.
 🐱 dueTime : 얼마나 요소 방출을 지연시킬 것인가?
 🐯 schedular : 실행코드를 어떤 스레드에서 실행시킬 것인지를 정해준다.
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<Int> {
    return Observable.create { observer in
        observer.onNext(1)
        observer.onNext(2)
        observer.onNext(3)
        observer.onNext(4)
        
        return Disposables.create()
    }
}

observable()
    .delay(.seconds(3), scheduler: MainScheduler.instance)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 
 🦁 주의할 점은 구독하고 나서 n초간 요소 방출을 대기시키는 것 뿐이지 구독 자체를 지연시키는 것은 아니다.

 [결론]
 🐯 단순히 첫 요소 방출을 일정 시간 동안 지연시키고 싶다면 delay 연산자를 쓰자
 
 */
