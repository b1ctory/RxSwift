import RxSwift

/*
 
 🧊 BehaviorSubject는 PublishSubject와는 다르게 초기값을 가지고 시작한다.
 😶‍🌫️ 다만 그 초기값이 매번 일정한 것이 아니라 가장 마지막에 방출되었던 값이 초기값으로 지정된다.
    -> 즉 ,Observable을 제일 처음 구독하는 구독자는 설정해준 초기 값으로 시작을 하게 되고,그 다음 구독자 부터는 구독하기 직전에 방출되었던 값으로 시작을 하게 된다.
 😮‍💨 BehaviorSubject 는 항상 초기값을 가지고 시작하기 때문에 초기화하는 방식도 PublishedSubject와 조금 다르다.
 👱🏻‍♀️ 초기화할 때 제일 처음 구독하는 구독자를 위해 value:에 초기값을 넣어주어야 한다.
 
 */

let disposeBag = DisposeBag()
let behaviorSubject = BehaviorSubject<String>(value: "Start")

behaviorSubject.subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)

behaviorSubject.onNext("히히")
behaviorSubject.onNext("메롱")

behaviorSubject.subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)

/*
 [출력 결과]
 Start
 히히
 메롱
 메롱
 
 👩🏻‍🎓 이렇게 구독하게 되면 항상 초기값을 가지고 시작하는 BehaviorSubject는 새로운 정보를 불러오기 전에 가장 최신의 데이터를 사용해서 placeholder처럼 사용할 때 유용하다.
 💂🏻‍♀️ 예를들면 어떤 이미지를 호출해주는 BehaviorSubject가 있고 해당 BehaviorSubject를 이미지뷰와 바인딩 시켰을 때 가장 최근에 불려왔었던 이미지를 미리 채워둠으로서 로딩하는 모습을 감추고 싶다하는 시나리오에 매우 유용하게 사용될 수 있다.
 
 [결론]
 🤵🏻‍♀️ Subject를 구독할 때 가장 최근에 불려와졌던 값을 가지고 처리하고 싶은 경우 BehaviorSubject를 사용하도록 하자.
 */
