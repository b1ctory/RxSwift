import RxSwift

/*
 
 🍿 Connectable Observable은 일반 Obaservable을 계승한 클래스
 🥮 일반 Observable은 별다른 처리 없이 subscribe 해도 해당 스트림에서 넘어오는 반면,
 🍰 Connectable Obesrvable은 connect를 시켜줘야 구독자들에게 데이터를 넘겨준다.
 🧃 반대로 말하면 Connectable Observable을 connect 시켜주지 않으면 아무리 subscribe를 한들 스트림에서 흘러오는 데이터를 받아볼 수 없다는 것이다.
 🧊 이렇게 connect 가능한 Observbale이라 Connectable Observable이라고 불리는 것!
 🍠 Connectable Observable을 생성하는 두가지 방법
    🍎 Observable 타입을 publish 시켜주기
    🍊 Observable 타입을 replay 시켜주기
 
 */
let disposeBag = DisposeBag()
let observable = Observable.of("🟥", "🟨", "🟩").publish()
  
print("Start first subscription")
observable.subscribe(onNext: { element in
    print("Subscriber1 \(element)")
}).disposed(by: disposeBag)

print("Start second subscription")
observable.subscribe(onNext: { element in
    print("Subscriber2 \(element)")
}).disposed(by: disposeBag)

let observable2 = Observable.of("🟥", "🟨", "🟩").publish()
  
print("Start first subscription")
observable2.subscribe(onNext: { element in
    print("Subscriber1 \(element)")
}).disposed(by: disposeBag)

print("Start second subscription")
observable2.subscribe(onNext: { element in
    print("Subscriber2 \(element)")
}).disposed(by: disposeBag)

observable2.connect()
    .disposed(by: disposeBag)

/*
 
 🍋 Connectable Observable은 Hot Observable이고, publish()를 통해서 share(0 처럼 Cold Observable로 변환해주는 것
 
 */

let observable3 = Observable.of("🟥", "🟨", "🟩").publish().refCount()
  
print("Start first subscription")
observable3.subscribe(onNext: { element in
    print("Subscriber1 \(element)")
}).disposed(by: disposeBag)

print("Start second subscription")
observable3.subscribe(onNext: { element in
    print("Subscriber2 \(element)")
}).disposed(by: disposeBag)

/*
 
 🫑 publish를 이용해서 Connectable Observable을 만들게 되면 connect() 호출이 필수적
 🫐 하지만 refCount를 사용하게 되면 이런 Connectable Observable에서의 connect, disconnect를 자동적으로 관리
 🍇 refCount()를 호출하고서 connect()를 별도로 호출해주지 않아도 요소들이 잘 방출
 🍉 refCount는 얼마나 많은 구독자(observer)들이 생기는지 추적하고 맨 마지막 구독자가 작업을 마무리할 때까지 disconnect를 대시키시는 식으로 자동으로 관리
 🍑 refCount를 호출하는 순간 해당 Connectable Observable은 일반적인 Observable처럼 작동
 🍌 share() 이랑 publish().refCount() 동일하므로 일반적인 상황에서 방출되는 요소들을 모두 구독자에게 공유시키고 싶다면 publish().refCount() 말고 그냥 share()을 사용하자.
 
 [결론]
 🐯 Connectable Observable은 Hot Observable이다.
 🐯 publish()를 통해서 일반 Observable을 Connectable Observable로 변환해줄 수 있다.
 🐯 근데 publish()만 쓰게되면 connect()를 직접 호출해서 connect 시켜줘야한다.
 🐯 일반적인 상황에서 publish().refCount() 를 사용할거면 그냥 share() 사용하자.
 
 */
