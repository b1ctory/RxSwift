import RxSwift

/*
 
 🥩 ignoringElements는 이벤트에서 방출되는 요소들을 모두 무시할때 사용하는 연산자이다.
 🍤 사용법 : 구독하기 전에 .ignoreElements()를 호출해준다.
    -> observable.ignoreElements().subscribe()
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<String> {
    return Observable.create { observer in
        observer.onNext("🍷")
        observer.onNext("🍹")
        observer.onNext("🍺")
        observer.onNext("🍸")
        observer.onCompleted()
        
        return Disposables.create()
    }
}

// 실행 결과 : Completed!
observable().ignoreElements().subscribe(onNext: { element in
    print(element)
}, onCompleted: {
    print("Completed!")
}).disposed(by: disposeBag)

/*
 🍩 위 코드의 실행 결과에서 알 수 있듯 모든 onNext이벤트는 무시되고 onCompleted만 호출되는 것을 확인할 수 있다.
 🧋 단, onError 이벤트는 무시하지 않으니 유의하자!
 
 [결론]
 🐯 의도적으로 Observable에서 방출되는 element들을 무시하고 싶다면 ignoringElements를 사용하자!
 */
