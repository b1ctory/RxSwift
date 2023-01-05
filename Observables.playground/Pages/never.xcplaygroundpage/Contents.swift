import RxSwift

/*
 🦭 never는 말 그대로 Observable이 아무런 이벤트도 방출시키지 않도록 해준다! (empty와는 정반대의 성격)
 🙏🏻 단! onDisposed는 제외!
 */

let neverObservable = Observable<Int>.never()

/*
 [결론]
 🐯 never를 사용하면 onDisposed를 제외하고 아무런 이벤트를 방추릿키지 않는 Observable을 생성할 수 있다.
 */
