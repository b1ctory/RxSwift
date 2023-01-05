import RxSwift

/*
 🦭 onNext, onError, onCompletd, onDisposed 등의 이벤트를 원하는 시점에서 방출시킬 수 있게 도와주는 것이 create 연산자이다.
 🦈 create 연산자를 사용해 자유자재로 원하는 시점에 원하는 이벤트를 방출시키는 Observable을 생성하고 subscribe 해서 사용할 수 있다.
 */

// 🍞 먼저 Observable<T>.create() 로 틀을 만들어준다.
let customObservable = Observable<String>.create { observer in
    return Disposables.create()
}

/*
 [위 코드에 대한 설명]
 🍑 Observable<String>의 제네릭 타입은 onNext로 방출시킬 요소의 타입!
 🥨 그리고 create 클로저의 파라메터인 observer를 이용해서 onNext, onError, onCompleted 이벤트를 방출할 수 있다.
 🥐 Observable을 구독하게 되면 disposable이라는 것이 리턴되어 처리를 해줘야하는데, 그 disposable의 정체가 Disposables.create() 이다. (필수 구현 요소)
 🍦 틀을 만든 후, 각 이벤트를 어떻게 호출하는가? -> 아래의 코드를 확인!
 */

let disposeBag = DisposeBag()

let secondCustomObservable = Observable<String>.create { observer in
    observer.onNext("🍔🍟🥤")
    observer.onCompleted()
    
    return Disposables.create()
}

secondCustomObservable.subscribe(onNext: { element in
    print(element)
}, onCompleted: {
    print("OnCompleted")
}).disposed(by: disposeBag)

/*
 🍹 그러나 create는 변수로 선언하는 방식보다는 함수로서 선언하는 방식이 더 자주 사용된다. 함수로 바꾸면 다음과 같다.
 */
func secondCustomObservableFunc() -> Observable<String> {
    return Observable<String>.create { observer in
        observer.onNext("🍔🍟🥤")
        observer.onCompleted()
        
        return Disposables.create()
    }
}

secondCustomObservableFunc().subscribe(onNext: { element in
    print(element)
}, onCompleted: {
    print("OnCompleted")
}).disposed(by: disposeBag)

/*
 [결론]
 🐯 Custom Observable 스트림을 만들고 싶을 때는 create 를 이용해서 직접 만드는 것이 좋다.
 */
