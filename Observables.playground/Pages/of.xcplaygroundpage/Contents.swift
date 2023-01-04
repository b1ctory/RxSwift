import RxSwift

/*
 🐝 of는 하나의 요소만 방출하고 끝나버리는 just와 달리 여러개의 요소들을 순차적으로 방출할 수 있다.
 */

let ofObservable = Observable.of("A", "B", "C", "D", "E", "🐳")

ofObservable.subscribe { element in
    print(element)
} onCompleted: {
    print("Completed")
}

/*
 [주의사항]
 🟥 of() 안에 들어가는 요소들은 타입 추론되어 타입 제안이 생기기 때문에 하나의 타입으로 통일시켜줘야 한다.
 🟧 불가능한 표현 예시
 -> let ofObservable = Observable.of("A", 3, "B", 2, "C", 1)
 🟨 단, 선언시 타입을 Any로 지정한다면 사용 가능하다.
 -> let ofObservable: Observable<Any> = Observable.of("A", 3, "B", 2, "C", 1)
 
 [결론]
 🐯 간단히 한 Observable에서 에서 여러 요소들을 순차적으로 방출시키고 싶다면 of를 사용하면 된다!
 */
