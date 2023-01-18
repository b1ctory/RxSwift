import RxSwift

/*
 
 🐼 zip은 여러 Observable에서 방출되는 요소들을 하나로 결합하여 구독자에게 전달해주는 연산자이다.
 🦁 각 Observable에서 요소가 방출되고 서로 짝이 생겨야 비로소 구독자에게 결합된 짝을 전달시켜주는 연산자이다.
 🐻‍❄️ 만약 first에서 3개의 요소를 방출시키고 second에서 100만개의 요소를 방출시켰다고 해도 구독자에게는 3개의 요소밖에 전달되지 않는 것!
 
 */

let disposeBag = DisposeBag()

let first = PublishSubject<Int>()
let second = PublishSubject<Int>()

Observable.zip(first, second)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

first.onNext(1)
second.onNext(4)
second.onNext(5)
first.onNext(2)
second.onNext(6)
first.onNext(3)

print("---------------")

first.onNext(1)
first.onNext(2)
first.onNext(3)
first.onNext(4)
first.onNext(5)

second.onNext(1)

/*
 
 🐥 여러 Observable을 결합해서 사용하는 것이기 때문에 한 Observable이라도 onCompleted 이벤트가 방출되지 않으면 구독하고 있는 Observable이라도 메모리 누수 발생할 수 있으니 주의할 것!
 🐣 또한 여러 Observable을 조합하여 사용하는 것이기 때문에 각 Observable이 방출하는 요소의 타입이 일관되어야 컴파일 가능
 
 [결론]
 🐯 여러 Observable에서 방출되는 요소들을 짝지어 구독자에게 전달하고 싶다면 zip
 🐯 각 결합된 Observable들에서 모두 onCompleted 이벤트가 방출되어야 결합시킨 Observable에서도 onCompleted이벤트가 방출되기 때문에 누수에 주의할 것!
 
 */
