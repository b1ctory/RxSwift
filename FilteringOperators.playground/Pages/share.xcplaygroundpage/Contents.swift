import RxSwift

/*
 
 🫶🏼 RxSwift에서의 share도 무언가를 공유하다 라는 개념을 지닌 연산자이다.
 🤌🏻 무엇을 공유하는가? -> Observable Sequence를 공유한다.
 👐🏻 Observable은 구독자에 의해 구독되기 전까지 Observable.create 클로저 내부에 구현되어있는 내용들이 실행되지 않는다. -> 이것을 Cold Observable이라고 한다.
 🙌🏻 그리고 Observable은 구독자에 의해 구독이 되면 그제서야 Observable.create 클로저 내부에 구현되어있는 코드들이 실행되는 것이다.
 ✌🏻 이런 특성 때문에 같은 Observable을 서로 다른 구독자가 구독을 하게 되면 Observable.create 클로저 안에 구현되어있는 코드가 구독한 횟수만큼 호출되는 것이다.
 👋🏻 하지만 share 연산자를 이용한 Observable을 구독하게 되면 여러 구독자가 Observable 시퀀스를 공유할 수 있게 되는 것이다.
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<Int> {
    return Observable.create { observer in
        observer.onNext(1)
        observer.onNext(2)
        observer.onNext(3)
        
        return Disposables.create()
    }
}

let sharedObserver = observable().share()

sharedObserver.subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)

sharedObserver.subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)

/*
 [실행 결과]
 1
 2
 3
 
 🐶 원래라면 구독을 두 번 했기 때문에 두 번 구독한대로 1,2,3,1,2,3 이렇게 출력되겠지만, share 연산자를 사용하니 1,2,3 한 번만 호출된 것을 확인할 수 있다.
 🐱 이런식으로 share를 사용해도 되고 아예 Observable을 share로 밖에 못사용하게 Observable.create 할 때부터 share을 호출해줘서 사용해도 된다.
 */

func observable() -> Observable<Int> {
    return Observable.create { observer in
        observer.onNext(1)
        observer.onNext(2)
        observer.onNext(3)
        
        return Disposables.create()
    }.share()
}

/*
 🐻‍❄️ share(replay:_, scope:)
 🐰 replay와 scope 파라메터를 체워주게되면 새로운 구독자가 해당 Observable을 구독하는 시점 이전에 방출되었던 요소들에 접근할 수 있게 도와준다.
 🦊 replay라는 파라메터의 값만큼 새로운 구독이 생겼을 때 이전에 방출되었던 요소들을 갖고 시작한다.
 🐼 scope에는 총 두가지 종류가 있는데, 이는 해당 스트림을 구독하고 있는 구독자의 수와 관련있는 파라메터이다.
    🐻 .whileConnected : whileConnected는 해당 스트림을 구독하고 있는 구독자의 수가 1개 이상일 경우에만 유지된다. 즉, 구독자의 수가 0이 되면 다음 새로 구독하는 구독자는 아무리 replay 값이 정의되어 있다 하더라도 내가 구독하기 전에 방출되었던 요소들을 알 수 없게 되는 것
    🐥 .forever : forever은 whileConnected와 다르게 스트림에 구독자가 0개라도 해당 스트림이 무조건 살아남아서 새로운 구독자에게 구독하기 전에 방출되었던 요소들을 전달해줄 수 있게 된다.
 🐵 scope의 기본값은 whileConnected이고, 특수한 케이스 외에 일반적으로는 whileConnected가 사용된다.
 
 🐳 언제 share를 유용하게 사용할 수 있을까?
    -> 대표적으로 Observable을 구독한 결과를 가지고 여러곳에서 공유해서 사용할 때 유용하다. (share 존재의 목적이기도 하다.)
 
 [결론]
 🐯 하나의 Observable 시퀀스의 결과를 여러곳에서 공유해서 사용하고 싶다면 share을 이용해서 불필요한 낭비를 막는 것이 좋다.
 */
