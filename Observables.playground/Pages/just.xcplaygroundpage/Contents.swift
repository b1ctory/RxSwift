import RxSwift

/*
 🐶 Observable을 생성하는 데에는 just, of, from 연산자가 있다.
 🐶 조금 더 섬세하게 컨트롤이 필요하다면 create를 이용해서 생성할 수 있다. (추후 설명)
 🐶 just는 간단하게 Observable을 생성하는 방식 중 하나이다.
 
 🧶 just는 오직 하나의 요소를 방출시키고 끝나는 ObservableType 프로토콜의 TypeMethod 이다.
 🍁 쉽게 말해, just는 말그대로 하나의 Element (요소)를 방출시키는 Observable이다.
 */

// 🌙 just는 단 하나의 요소를 방출시키기 때문에 .just() 호출과 동시에 방출 시킬 값을 넣어준다.
let justStringObservable = Observable.just("This is String Observable")
let justIntObservable = Observable.just(1004)

/// 필요한 이벤트만 처리!
justStringObservable
    .subscribe(onNext: { element in
        print(element)
    }, onCompleted: {
        print("Completed!")
    })

justIntObservable
    .subscribe(onNext: { element in
        print(element)
    }, onCompleted: {
        print("Completed!")
    })

// 🎄just에 넣을 수 있는 타입을 제한할 수도 있다. 타입제한을 준 상태에서 다른 타입을 넣어주면 에러 발생!
let stringObservable: Observable<String> = Observable.just("String Observable : 타입 제한")

/*
 [결론]
 🐯 간단하게 하나의 요소만 방출하는 Observable만 생성하고 싶다면 just 사용!
 */
