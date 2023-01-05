import RxSwift

/*
 🦁 from은 배열로 요소를 받은 후에 하나하나 요소로서 방출해주는 연산자이다.
 */

let fromObservable = Observable.from(["🐰","🖤","🌞"])

fromObservable.subscribe { element in
    print(element)
} onCompleted: {
    print("Completed")
}

/*
 🍇 실행시켜보면, of 연산자를 사용했을 때와 거의 똑같다.
 🍫 of 연산자에 from에 넣은 것처럼 배열을 그대로 넣어서 한번 확인해보자.
 */
let ofObservable = Observable.of(["🐰","🖤","🌞"])
ofObservable.subscribe { element in
    print(element)
} onCompleted: {
    print("Completed")
}

/*
 [출력 결과 비교]
 🐰
 🖤
 🌞
 Completed
 ["🐰", "🖤", "🌞"]
 Completed
 
 🍰 출력 결과를 보면 알 수 있듯이, of는 배열 그대로를 전달한다.
 
 [결론]
 🐯 배열의 값 하나하나를 Observable의 요소로서 방출시키고 싶다면 from을 사용하자!
 */
