import RxSwift

/*
 📷 deffered는 "무언가를 미루다" 라는 의미로 사용되는 연산자이다.
 🧸 deferred는 Observable이 생성되는 시점을 구독자에 의해서 구독되기 전까지 미뤄주는 역할을 한다.
 🧇 deferred는 Observable에서 직접 호출이 가능한데, deferred 클로저 내에서 실제로 구독할 Observable을 리턴해주면 된다.
 */
let observable = Observable<String>.deferred {
    return Observable.just("⚾️⚽️🏀🏈🏐")
}

/*
 [왜 사용해야 하는가?]
 🍾 예를 들어, Observable.just(doSomething())이라는 Observable이 있다.
 🍷 여기서 doSomething() 이라는 함수는 Observable이 선언되는 시점에 미리 계산을 하게 된다. -> 아래의 코드 참고
 */
let someObservable = Observable.just(doSomething())

/*
 🍿 위의 코드를 실행시켜보면 someObservable을 구독하지도 않았는데 doSomething()이 호출된다.
 🍩 .just 뿐만 아니라, .from, .of 모두 선언되는 시점에 미리 계산하게 된다.
 🍯 그런데 만약 doSomething()이 간단하지 않고 복잡한 연산을하는 메서드라면, 시간이 오래걸릴 뿐 아니라 Observable을 구독하기도 전에 시간을 소요시키는 것은 큰 낭비가 되고, 주요 스레드를 방해하는 불상사가 생길 수 있다.
 🍭 이렇게되면 앱은 그 시간동안 멈춘 것처럼 보인다. 이를 방지하기 위해 구독되기 전에 굳이 계산을 할 필요가 없는 Observable들을 deferred로 처리하면 되는 것이다.
 🍪 즉, 아래와 같이 deffered로 감싸주게 되면 구독이 되기 전까지는 doSomething() 이라는 작업을 실행햐지 않는다.
 */

let defferedSequence = Observable<Any>.deferred {
    return Observable.just(doSomething())
}

func doSomething() {
    print("⚾️⚽️🏀🏈🏐")
}

/*
 [결론]
 🐯 무거운 작업의 Observable을 만들어 사용할 때는 deferred를 이용해서 구독하는 시점과 동시에 작업을 시작할 수 있도록 하여 쓸데없는 낭비를 막자!
 🐯 혹은 구독과 동시에 최신값이 필요한 경우 Observable을 deferred로 감싸서 사용하자!
 */
