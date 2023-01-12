import RxSwift

/*
 🦦 Relay는 RxCocoa에 속해있는 클래스이다. Relay에는 크게 PublishSubject랑 BehaviorSubject 클래스가 있다.
 🦥 PublishRelay와 BehaviorRelay는 PublishSubject와 BehaviorSubject의 wrapper 클래스이다.
 
 🐿 Subject는 일반 Observerable처럼 onNext, onError, onCompleted 이렇게 이벤트를 방출시킬 수 있다.
 🦫 Relay는 onNext 대신 accept 라는 이벤트를 방출한다. (accept가 onNext의 역할) 그리고 onError나 onCompleted 이벤트는 모두 무시한다. 오직 accept 이벤트만 방출하고 onError나 onCompleted 메서드가 방출되도 무시하기 때문에 시퀀스가 절대 죽지 않는 것이다.
 🦨 Relay는 이러한 시퀀스가 절대 죽지 않는다는 특성을 이용하여 UI를 다룰 때 주로 사용된다.
 🕊 예를 들어 사용자의 input을 관찰하고 있는 Observable에서 에러가 나면 그 상태로 시퀀스가 끝나버리기 때문에 더 이상 사용자의 input을 관찰할 수 없다. 하지만, Relay를 사용한다면 이런 error가 난다고 해도 무시하기 때문에 시퀀스가 끝나지 않고 다음 input을 정상적으로 관찰할 수 있게 되는 것!
 */
