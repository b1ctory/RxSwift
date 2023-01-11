import RxSwift

/*
 
 🐰 Subject : 구독자가 구독하는 시점 이후의 이벤트들만 전달받을 수 있도록 도와준다. 그리고 Subject를 생성하기 위해 가장 기본적으로 사용되는 것이 PublishSubject 이다.
 
 */

let disposeBag = DisposeBag()

var subject = PublishSubject<String>()
subject.onNext("hi")
subject.onCompleted()

/*
 
 🦊 subject는 Observer의 역할도 하지만 동시에 Observable의 역할도 할 수 있기 때문에 이벤트를 방출할 수 있는 것이다.
 
 */

subject.onNext("🐶")
subject.onNext("🐱")
subject.onNext("🐭")
subject.onNext("🦊")

subject.subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)

subject.onNext("🐶")
subject.onNext("🐱")
subject.onNext("🐭")
subject.onNext("🦊")

/*
 [출력결과] -> 구독 이후 호출해준 이벤트만!
 🐶
 🐱
 🐭
 🦊
 
 👠 이와같이 Subject 특성을 이용해서 구독하는 시점에따라 이전 이벤트를 받을 필요가 없는 경우 유용하다.
 
 [결론]
 🐯 구독하는 시점에 영향을 주는 Observable을 생성하고 싶다면 일반 Observable이 아닌 PublishSubject를 사용하자!
 
 */
