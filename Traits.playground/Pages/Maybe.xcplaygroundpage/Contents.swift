import RxSwift

/*
 ⚽️ Maybe는 Single과 Completable의 중간 특성을 가지는 Trait 이다.
 🏀 Maybe는 Single과 Completable이 가지는 이벤트를 모두 가진다.
    -> .success() / .completed / .error()
 🏈 즉, Maybe는 .success()를 통해 요소를 방출시킬 수도 있고, .completed를 통해서 완료 여부만 전달할 수 있고, .error()를 통해서 에러 처리까지 할 수 있다.
 ⚾️ 이러한 Maybe의 특성 덕에 이벤트에서 요소를 방출시킬 수도 있지만, 꼭 요소를 방출시킬 필요가 없는 경우에 유용하게 사용될 수 있다.
 🥎 Maybe도 다른 Trait과 생성하는 방법은 비슷하다.
 */
let disposeBag = DisposeBag()
func maybeObservable() -> Maybe<Any> {
    return Maybe.create { maybe in
        maybe(.success("maybe"))
//        maybe(.error("error"))
        maybe(.completed)
        return Disposables.create()
    }
}

/*
 🎾 다만,Maybe는 Single의 .success() 특성도 가지고있다보니 제네릭 타입으로 꼭 방출할 요소의 타입을 지정해주어야 한다.
 
 [사용 방법]
 🏐 위의 스크린샷과 같이 maybe로 Observable을 생성하고서 구독을 하게 되면 아래와 같이 .success(), .completed, error() 세 가지 이벤트에 대한 처리를 할 수 있다.
 */

maybeObservable().subscribe(onSuccess: { element in
    print("\(element)와 함께 completed !.")
}, onError: { error in
    print("\(error)와 함께 completed !")
}, onCompleted: {
    print("방출 요소 없이 completed !")
}).disposed(by: disposeBag)

/*
 🥋 일반 Observable을 .asMaybe() 연산자를 이용해서 시퀀스를 변환시키는 것도 가능하다.
 🛹 그런데 Single에서 본 것 처럼 Observable 시퀀스를 .asSingle() 을 이용해서 Single 시퀀스로 변경할 때 onSuccess가 onNext + onCompleted를 합쳐놓은 것이기 때문에 onCompleted만 발생하는 Observable을 Single로서 구독하면 onError 이벤트가 방출된다.
 🛷 하지만, asMaybe()의 경우에는 .completed를 통해 onCompleted만 따로 받을 수 있기 때문에 비교적 자유롭게 시퀀스를 오갈 수 있다!
 
 [결론]
 🐯 Single과 Completable 두 특성을 모두 사용하고 싶다면 Maybe를 사용하자!
 */
