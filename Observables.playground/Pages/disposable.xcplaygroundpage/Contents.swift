import RxSwift

/*
 🌹 어떤 Observable을 .subscribe()를 통해 구독하게 되면, 해당 Observable은 Disposable이라는 것을 리턴해준다.
 💥 이에 대한 처리를 해주지 않으면, warning이 발생한다.
 
 🌈 Dispose라는 개념은 RxSwift에 있어서 구독을 취소하는 개념과 동일하다.
 🌼 어떠한 Observable이 모든 요소들을 방출하고서 onCompleted까지 방출됐다면 더 이상 해당 Observable을 구독할 이유가 없다. onCompleted를 통해 더이상 방출해줄 이벤트가 없다고 알려준 것이기 때문이다.
 ☘️ 그렇다면 구독자는 그 Observalbe에 대한 구독을 취소해줄 필요가 있다. 그렇지 않으면 메모리 누수가 발생할 수 있기 때문이다!
 ✈️ 바로 이럴 때 .dispose()라는 연산자를 사용해서 구독을 취소시킬 수 있다.
 */

// 🔮 직접 .dispose()를 호출하여 구독 취소!
Observable.just(100)
    .subscribe(onNext: { element in
        print(element)
    }).dispose()

/*
 🐞 이렇게 일일히 시퀀스를 .dispose()를 통해 구독취소 하는 것은 효과적인 방법은 아니다.
 🍊 왜냐하면 각 시퀀스를 따로따로 구독 취소하는 것에 따른 리스크가 있고, RxSwift에서 제공하는 더 나은 방법인 disposeBag을 사용하는 방법이 있기 때문이다.
 🍌 disposeBag은 disposable한 것들을 담아주는 bag라고 생각하면 된다. disposeBag에 disposable한 것들을 담아두고서 마지막에 한번에 구독 취소할 수 있도록 도와주는 것이다.
 */

/// 예를 들어, 하나의 Observable을 1, 2, 3, 4라는 구독자가 subscribe 하고 있다고 해보자.
let observable = Observable.of(1, 2, 3, 4)
let firstSubscriber = observable.subscribe(onNext: { _ in
    
})

let secondSubscriber = observable.subscribe(onNext: { _ in
    
})

let thirdSubscriber = observable.subscribe(onNext: { _ in
    
})

let fourthSubscriber = observable.subscribe(onNext: { _ in
    
})

// 🥑 만약 모든 구독자들이 Observable의 구독을 끊고 싶다면 각각 dispose 시켜주면 된다.
firstSubscriber.dispose()
secondSubscriber.dispose()
thirdSubscriber.dispose()
fourthSubscriber.dispose()

// ❄️ 이렇게 하면 모든 구독자와 Observable의 관계는 끊어지지만, disposeBag을 이용하면 더 간단히 구현할 수 있다.
/// 1. isposeBag 선언
let disposeBag = DisposeBag()

/// 2. 그리고 Obesrvable을 subscribe() 할 때 disposed(by: ) 라는 연산자를 이어서 호출
/// 3. 그리고 전역변수로 선언했던 disposeBag 을 그대로 넣어주면 끝이다!
observable.subscribe(onNext: { _ in
    
}).disposed(by: disposeBag)

/*
 🦄 이렇게 처리하면 해당 뷰 컨트롤러가 해제될 때 자연스럽게 disposeBag이라는 변수도 메모리에서 해제되면서 그 안에 들어있던 모든 disposable 요소들이 한번에 해제되는 것이다.
 🌷 또한 nil을 넣어줌으로서 임의로 해제시킬 수도 있다.
    disposeBag = nil -> 다만, 당연하게도 disposeBag이 옵셔널 타입이어야 한다.
 
 🪸 구독을 취소하지 않으면 왜 메모리 누수가 발생할까?
    🌲 예를 들어, FirstViewController와 SecondViewController가 있다고 가정해보자.
    🌎 SecondViewController에는 "☀️" 를 1초에 한번 씩 배출하는 Observable이 있다.
    ☂️ 그리고 그 Observable을 구독한 구독자가 있다.
    🍉 이 때 SecondViewController를 해제한다고 생각해보면 여기서 disposeBag 사용 여부에 따른 차이가 생긴다.
 
    1. disposeBag을 사용하지 않은 경우
       "🥕" -> "🥕" -> "🥕" -> 해제 -> 🥕 -> 🥕 -> ... 무한 반복
    2. disposeBag을 사용한 경우
       "🥕" -> "🥕" -> "🥕" -> 해제 -> onDisposed
 
    🍊 Observable을 구독하고 실행되는 것은 모두 비동기로 일어나기 때문에 이런 결과가 나타나는 것이다.
    🍋 만약 SecondViewController가 많은 양의 API를 호출하는 것을 Observable로서 관리하고 있었다면 엄청난 메모리 낭비가 일어났을 것
    🫑 그렇기 때문에 무조건적으로 subscribe()를 한 뒤에는 disposeBag에 넣어주어야 한다.
 
 [결론]
 🐯 Observable을 subscribe 할 때는 무조건 dispose(by:)를 호출해서 disposeBag에 넣어서 관리하도록 하자
 🐯 특수한 경우에는 바로 .disposeBag()을 이용해서 구독해제를 해주어도 된다.
 */



