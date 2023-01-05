import RxSwift

/*
 
 🐵 Observable을 초기화하고 싶을 때, 아래의 방식으로 초기화하려고 하면 에러가 발생한다.
 🦭 let emptyObservable: Observable = Observable<Any>()
 ❌ error Message : 'Observable<Element>' initializer is inaccessible due to 'internal' protection level
 
 📒 이럴때 사용하는 것이 empty() 이다. 아래와 같이 사용해서 빈 Observable을 선언할 수 있다.
 */

let emptyObservable: Observable = Observable<Any>.empty()


/*
 ✅ empty()는 Observable을 초기화 시킬 때도 사용되지만,
 🚺 즉시 completed 되는 Observable이나 element가 0개인 Observable을 의도적으로 리턴하고 싶을 때 유용하다.
 
 [결론]
 🐯 empty를 이용해서 Observable을 초기화할 수 있다.
 🐯 의도적으로 즉시 completed 되는 Observable을 리턴하고 싶을 때에도 유용하게 사용할 수 있다.
 */
