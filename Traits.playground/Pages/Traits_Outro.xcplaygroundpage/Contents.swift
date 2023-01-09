import RxSwift

/*
 😀 Traits 마무리 정리
 
 😍 RxSwift의 Traits는 Single / Completable / Maybe 세가지가 있다.
 🥰 그리고 각 Trait은 아래와 같이 이벤트를 방출시킬 수 있다.
 */

// RawObservable
func rawObservable() -> Observable<Any> {
    return Observable.create { observable in
        observable.onNext("Raw Observable")
        observable.onError(Error)
        observable.onCompleted()
        
        return Disposables.create()
    }
}

// Single
func singleObservable() -> Single<Any> {
    return Single.create { single in
        single(.success("Single Observable"))
        single(.failure(Error.Type))
        
        return Disposables.create()
    }
}

// Completable
func completableObservable() -> Completable {
    return Completable.create { completable in
        completable(.completed)
        completable(.error(Error.Type))
        
        return Disposables.create()
    }
}

// Maybe
func maybeObservable() -> Maybe<Any> {
    return Maybe.create { maybe in
        maybe(.success("Maybe Observable"))
        maybe(.error(Error))
        maybe(.completed)
        
        return Dispodables.create()
    }
}

/*
 [결론]
 😎 상황에 맞게 Trait을 골라서 사용하자!
 */
