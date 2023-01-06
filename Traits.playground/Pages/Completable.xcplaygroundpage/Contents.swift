import RxSwift

/// Observable
func rawObservable() -> Observable<Any> {
    return Observable.create { observber in
//        observber.onNext()
//        observer.onError()
//        observer.onCompleted()
        return Disposables.create()
    }
}

/// Completable
func completableObservable() -> Completable {
    return Completable.create { completable in
//        completable(.completed)
//        completable(.error())
        return Disposables.create()
    }
}

/*
 [Completed의 이벤트 타입]
 🦊 .completed : 완료 여부를 알려주는 이벤트
 🦉 .error() : onError와 같은 역할
 
 🐼 Completable은 어떤 액션이 성공했는지 혹은 에러가 발생하는지 두 가지 타입만 받고싶을 때 사용하면 유용하다.
 🐱 Completable은 Single로도 충분히 표현 가능하다.
 🦭 하지만, 어떤 액션의 성공 여부만 받고 싶을 때 굳이 .single(success(Element)) 이벤트를 통해 Element까지 같이 받을 필요가 있을까?
    -> 물론 해당 액션의 성공 여부를 Bool 값으로 받고 싶다면 Single을 사용해야겠지만 그저 완료 여부만 받고싶은 거라면 Single을 사용할 이유가 없다.
 🦦 아래에서 Observable을 Single, Completable로 각각 만들어보면 다음과 같다.
 */

/// Single
func saveSomething() -> Single<Bool> {
    return Single.create { single in
        // Saving something Action
        
        guard success else {
            single(.success(false))
            single(.failure(Error))
        }
        
        single(.success(true))
        
        return Disposables.create()
    }
}

/// Completable
func saveSomething() -> Completable {
    return Completable.create { completable in
        // Saving Action
        
        guard success else {
            completable(.error(Error))
        }
        
        completable(.completed)
        
        return Disposables.create()
    }
}

/*
 🍄 위 코드에서 가장 큰 차이점은 guard문 즉, 에러를 처리하는 부분에 있다.
 🍬 Single 같은 경우 액션의 성공 여부를 Bool로서 전달해주고 있으니 에러가 발생했을 때 single(.success(false)) 이렇게 실패했음을 알리는 false값도 전달하는 동시에 failure(Error)도 동시에 전달해주고 있다.
 🥪 이렇게되면 .success(false)와 .failure() 서로의 포지션이 모호해진다.
 🥘 또한 구독하는 입장에서도 에러 처리를 false Element로 받는 곳에서 처리해야할지 onError에서 처리해야 할지도 모호해진다.
 🍔 위와 같은 예시는 에러처리를 하나만 하지만, 여러개의 에러처리를 해줘야 할 경우 failure()로 Error를 전달해줄 때마다 single(.success(false))도 일일이 깉이 호출해주어야 한다.
 
 [결론]
 🐯 성공 여부만 전달해주고 싶을 때에는 Single이 아닌 Completable을 사용하자!
 
 */
