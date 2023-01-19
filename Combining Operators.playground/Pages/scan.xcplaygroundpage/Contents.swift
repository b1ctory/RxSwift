import RxSwift

/*
 
 😀 scan은 reduce와 구현 방식은 매우 흡사하지만 약간의 차이가 있다.
 😃 reduce의 경우에는 연속적으로 들어오는 요소에 대해 계산을 해주고 최종적으로 계산된 결과를 구독자에게 전달해주는 방식이었다면, scan 같은 경우에는 계산된 결과를 매 요소가 방출될 때마다 구독자에게 결과를 전달해준다.
 😄 reduce는 최종적으로 계산결과를 구독자에게 전달해주지만 sacn같은 경우에는 매번 구독자에게 계산 결과를 달달해주는 것을 확인할 수 있다.
 😆 이때 accumulator 클로저의 `lastState`라는 파라미터로 가장 최근에 상태를 이용해서 다음 상태를 처리해 줄 수 있기에 UI처리할 때 유용하게 사용할 수 있다.
 🥹 reduce와의 가장 큰 차이점이라면 onCompleted가 호출될 필요가 없다는 것이다. scan은 매번 계산된 값을 구독자에게 전달해주기 때문!
 
 [결론]
 🐯 scan을 이용하게 되면 accumulator 클로저의 파라미터로 이전 상태값을 가져올 수 있기 때문에 누적되는 데이터에 대해 쉽게 처리할 수 있다!
 */

// 버튼의 최근 state
//button.rx.tap.scan(false) { lastState, newState in
//    return !lastState
//}.subscribe(onNext: { state in
//    if state {
//        print("selected")
//    } else {
//        print("unselected")
//    }
//}).disposed(by: disposeBag)

// 버튼을 클릭할 때마다 1씩 증가
//button.rx.tap.scan(0) { lastValue, newValue in
//    return lastValue + 1
//}.subscribe(onNext: { element in
//    print(element)
//}).disposed(by: disposeBag)
