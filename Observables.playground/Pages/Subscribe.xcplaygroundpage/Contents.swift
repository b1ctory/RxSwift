import RxSwift
import UIKit

/*
 🦈 subscribe의 이벤트 클로저를 원하는 것만 골라서 사용할 수 있다.
 (예를 들어, onError 처리는 따로 하고싶지 않다면 onError는 지워버리면 된다!
 
 🦈 그러나, 주의할 점은 모든 이벤트에 대한 처리를 명시해주지 않았다면 이벤트들을 따로 구분하지 않게 된다.
 🦈 아래의 예시를 참조하자!
 */

let observable = Observable.of(1, 2, 3, 4)

// 이렇게 onError와 onDisposed를 모두 생략해주었다면
observable.subscribe { number in
    /*
     🦄 이 영역에서 onNext와 onError, onDisposed를 모두 처리해준다는 뜻!
     🐰 만약 onCompleted까지 생략해 줄 경우 onCompleted도 지워주면 된다.
     🦊 그러나, 이렇게 처리할 경우 (여러 이벤트가 동시에 생략) 추론이 힘들 수 있다.
     🐣 이렇게되면 원치 않을 때에도 이 영역에서 onError나 onCompleted 이벤트에 의해 실행될 수 있다.
     */
} onCompleted: {
    
}

// 여러 이벤트를 생략해서 subscribe 할 때는 이렇게 onNext나 이벤트 타입을 명시해주는 것이 안전하다!
observable.subscribe(onNext: { _ in
    
})

/*
 [메모리 누수]
 🌺 Observable을 subscribe 하게 되면 각 이벤트에 대한 처리를 할 수 있다. 그리고 각 이벤트에 대한 처리를 클로저 내부에서 진행했다.
 🔥 각 이벤트에 대한 처리를 하는 부분은 클로저이기 때문에 일반적인 클로저에서처럼 약한 참조를 꼭 해주어야 한다. 그래야 메모리 누수를 방지할 수 있기 때문!
 🌟 그래서 기본적으로 아래와 같이 작성해야 메모리 누수가 발생하지 않는다. (클로저 내부에서 self를 참조하는 경우에만 해당)
 */

final class SomeViewController: UIViewController {
    let someObservable = Observable.of(1, 2, 3, 4)

    override func viewDidLoad() {
        someObservable.subscribe(onNext: { [weak self] _ in
            guard let owner = self else { return }
            owner.someFunc()
        })
    }

    func someFunc() {
        print("something!")
    }
}

/*
 🌿 Rx에서는 [weak self] 를 매번 호출하는 것을 덜 번거롭게 호출할 수 있도록 이니셜라이저를 따로 만들어두었다.
 💦 with: 가 포함되어있는 .subscribe() 를 사용하면 된다.
 */

final class WithViewController: UIViewController {
    var observable = Observable.of(1, 2, 3, 4)
    
    override func viewDidLoad() {
        /*
         🍇 이런식으로 with에 self를 넘겨주고, owner로서 다시 받아주고서, owner를 클로저 내부에서 자유롭게 사용하면 된다.
         ⛄️ 위의 guard let 구문을 사용하는 방식의 동일한 표현이다.
         */
        observable.subscribe(with: self, onNext: { owner, _ in
            owner.someFunc()
        })
    }
    
    func someFunc() {
        print("something!")
    }
}

/*
 [결론]
 🐯 subscribe 할 때에 필요한 이벤트에 대해서만 골라서 처리할 수 있다. 다만, 여러가지 이벤트를 생략할 경우 onNext를 명시하여 모호함을 없애주는 것이 좋다.
 🐯 subscribe 하고 각 이벤트 처리는 클로저에서 하기 때문에 메모리 누수에 신경쓰자.
 */

