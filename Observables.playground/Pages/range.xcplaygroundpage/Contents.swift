import RxSwift

/*
 🎃 range는 for문처럼 Observable에서도 요소를 단순히 연속적으로 반복 방출시킬 수 있도록 도와주는 연산자이다.
 🫥 range는 Int 타입으로 제한이 이미 걸려있기 때문에 따로 타입 제한을 걸어줄 필요는 없다.
 🫶🏼 start와 count는 말 그대로 몇 부터 몇 번 카운트할 것인지를 정해주는 파라메터이다. (start..<count)
 */
let rangeObservable = Observable.range(start: 0, count: 10)

rangeObservable.subscribe(onNext: { element in
    print(element)
})

/*
 👻 from을 이용해서 range와 같이 표현할 수도 있다.
 😈 결국 from(0..<10)과 range(start: 0, count: 10) 은 그냥 스타일 차이 정도로 생각해도 되지만 이런 상황이라면 표현의 명확성을 위해 range를 사용하는 것이 낫다.
 */
let fromObservable = Observable.from(0..<10)

fromObservable.subscribe(onNext: { element in
    print(element)
})

/*
 [결론]
 🐯 단순 반복 요소를 방출하는 Observable을 만들고 싶다면 range를 사용하자
 🐯 range는 from으로도 동일하게 표현할 수 있다! 스타일 차이가 있을 뿐!
 */
