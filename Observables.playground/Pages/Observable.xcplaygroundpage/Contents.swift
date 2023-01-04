import RxSwift

/*
 "Rx의 핵심은 구독자들이 어떤 Observable을 구독하고 거기서 방출되는 이벤트들에 따른 액션을 취하는 것"
 
 🐬 Observable = "관찰 가능한"
 🐬 Observable은 이벤트를 방출할 수 있는 동시에 구독자들이 그 이벤트를 관찰할 수 있다.
 🐬 쉽게 말해 Observable은 이벤트를 방출해주는 친구!
 🐬 이벤트에 관심이 있는 구독자, 즉 이벤트가 방출됨에 따라 액션을 취해야하는 친구가 Observable 구독
 
 [이벤트 타입]
 🌹 onNext : Observable에서 새로운 요소들을 방출할 때마다 호출
 🍊 onError : Observable이 기대한 값이 아니거나 오류가 발생한 경우 호출
 🍋 onCompleted : Observable 시퀀스에서 에러가 발생하지 않고 더이상 방출할 요소가 없을 경우 호출
 🍏 onDisposed : Observable 시퀀스가 말그대로 disposed (버려진) 된 경우 호출
 
 */

/// 시간의 흐름에 따라 1, 2, 3, 4를 방출하겠다.
let observable = Observable.of(1, 2, 3, 4)

/// 구독
observable.subscribe { element in /// Element -> Observable에서 방출하는 1, 2, 3, 4를 의미한다.
    // onNext
    print("Observable로부터 \(element) 전달 완료 🐥")
} onError: { error in
    print(error.localizedDescription)
} onCompleted: {
    print("Observable이 정상적으로 종료되었습니다.")
} onDisposed: {
    print("Observable이 버려졌습니다.")
}

/*
 [결론]
 🐯 이런식으로 Observable을 구독해서 방출하는 값 혹은 이벤트에 대해 처리를 해주는 것이 Observable과 subscribe의 관계이다.
 🐯 Observable은 시간의 흐름에 따라 이벤트를 방출해주는 친구
 🐯 그리고 Observable이 방출하는 이벤트에 관심있는 곳에서 구독을 하고, 이벤트에 따라 액션을 취할 수 있다.
 */
