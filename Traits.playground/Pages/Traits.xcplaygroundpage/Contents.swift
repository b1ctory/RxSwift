import RxSwift

/*
 🧸 Traits는 Observable을 제한적인 기능만으로 create 하고싶을 때 사용하는 것이다!
 🧸 쉽게 말해서 Observable에서 파생된 친구들이 Traits 이다.
 
 [Traits가 생긴 이유]
 🐰 Observable은 생성하게 되면 구독자가 구독을해서 이벤트를 제어할 수 있다.
 🐻 그런데 이런 이벤트들을 제어하는데 있어서 상황에따라 onCompleted가 필요 없을 수도 있고, onNext를 굳이 사용하지 않는 경우가 생길 수도 있다.
 🐱 예를 들면 Observable로부터 성공 여부만 받고 싶은 경우 굳이 onCompletd가 필요하지 않다.
 🐥 이렇게 상황에 따라서 제한적인 이벤트만 받을 수 있도록 도와줄 수 있게 만들어진 것이 Traits 이다.
 
 [꼭 Traits를 사용해야 하는가?]
 🐻‍❄️ 일반 Observable로도 커버가 가능하지만, Traits를 사용하는 진짜 사용 목적은 "내가 짜고 있는 코드의 의도를 명확히 해준다." 는 것에 있다.
 🐶 타인이 내 코드를 봤을 때 의도하는 바를 이해하고 코드를 읽게되는 것이므로 상호간 커뮤니케이션에도 많은 도움이 된다.

 [Traits의 종류]
 🐬 RxSwift : Single / Completable / Maybe
 🦈 RxCocoa : Driver / Signal
 */
