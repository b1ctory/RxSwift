import RxSwift

/*
 🦖 Traits는 Observable의 파생형이다. 그 말인 즉슨, Traits도 엄연히 Observable이라는 뜻이다.
 🦕 또한 그 말은 곧 Traits를 생성하는 것은 일반 Observable을 생성하는 방식과 크게 다르지 않다고 해석할 수 있다.
 🕊 그래서 Single을 비롯한 다른 Traits도 Observable.create() 처럼 만들 수 있다 => Single.create()
 */

/// Observable create
func rawObservable() -> Observable<Any> {
    return Observable.create { observer in
//        observer.onNext()
//        observer.onError()
//        observer.onCompleted()
        
        return Disposables.create()
    }
}

/// Single (Trait)
func singleObservable() -> Single<Any> {
    return Single.create { single in
//        single(.success())
//        single(.failure())
        return Disposables.create()
    }
}

/*
 🌷 Single을 create로 생성할 때의 방식과 Observable의 방식을 비교해보면 매우 흡사하다.
 🌻 다만, Single생성 코드에서 보이는 것과 같이 onNext, onError, onComplete 대신 .success(), .failure() 이렇게 두가지 이벤트밖에 없는 것을 확인할 수 있다.
 
 [이벤트 타입]
 🌏 success
    🍎 .success() 는 일반 Observable의 onNext + onCompleted 와 같은 역할이다.
    🍊 onNext 이벤트를 방출함과 동시에 onCompleted 시키는 것
 🌎 failure
    🍋 .failure()는 onError와 같은 역할이다.
 🌍 그런데 왜 observer.success()가 아니라 observer(.success()) 일까?
    🍏 그 이유는 애초에 Traits라는 것이 Observable의 wrapper 구조체이기 때문이다.
    🫐 즉, Observable에서 방출되는 이벤트를 기호에 맞게 감싼 존재라고 생각하면 된다.
 🍿 이런 Single의 특성을 이용해서 단 한가지의 값 혹은 에러 두가지 형태를 보장받을 수 있을 때 Single을 사용하면 된다.
 🔮 대표적인 Single의 사용 예시로 API Request를 통해 하나의 보장된 요소나 에러를 받을 때 유용하다.
 
 [주의사항]
 🚘 Observable과 Single의 이벤트 타입이 서로 다르다 보니 Observable 스트림에서 Single 스트림으로 이동한다던지 하는 혼용시 문제가 생기게 된다.
 🚕 예를 들어 asSingle() 연산자를 사용해서 Observable -> Single 이렇게 시퀀스를 변환했다고 했을 때 .success() 는 onNext + onCompleted 와 같은 존재이니 만약 Observable에서 onCompleted가 발생하기 전 시점에 onNext가 없다면 Single로 변환 시 에러가 발생하게 되는 것이다.
 🚛 그렇기 때문에 Single을 사용하려면 일관성있게 Single로 시퀀스를 유지하는 것이 좋다.
 
 [결론]
 🐯 오직 하나의 값 혹은 에러 이렇게 두가지 형태만 보장해주는 Observable을 생성하고 싶다면 Single을 사용하자!
 */
