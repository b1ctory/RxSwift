import RxCocoa
import RxSwift

/*
 🧊 Behavior의 특징인 초기값을 가지고 시작하며, Relay의 특징인 onError나 onCompletd가 발생해도 무시한다.
 */

let disposeBag = DisposeBag()
var behaviorRelay = BehaviorRelay<String>(value: "시작~")

behaviorRelay.subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)

behaviorRelay.accept("메롱")

/*
 🐶 Relay가 애초에 UIKit에 관련된 RxCocoa에 속해있다보니 UI와 관련된 처리를할 때 매우 유용하다.
 
 [결론]
 🐯 BehaviorSubject를 사용하고 싶은데 onError와 onCompleted 이벤트를 모두 무시해서 시퀀스를 보호하고 싶다면 BehaviorRelay를 사용하자
 */
