import RxSwift

/*
 
 🦒 array를 for loop 돌리면서 index 값을 같이 받아오고 싶을 때 enumerated를 주로 사용한다.
 🦏 RxSwift에서의 enumerated 또한 index 값을 같이 받아오고 싶은 경우에 사용되는 연산자이다.
 
 */

var disposeBag = DisposeBag()

func observable() -> Observable<String> {
    return Observable.create { observer in
        observer.onNext("🐡")
        observer.onNext("🐠")
        observer.onNext("🐟")
        observer.onNext("🐬")
        observer.onCompleted()
        
        return Disposables.create()
    }
}

// 🐆 그리고 subscribe 하기 전에 enumerated 연산자를 호출해주고 subscribe 클로저 파라메터에 (index, element) 이렇게 선언해주고 사용하면 된다!
observable().enumerated()
    .subscribe(onNext: { index, element in
        print("\(element) at \(index)")
    }).disposed(by: disposeBag)

/*
 [결론]
 🐯 요소와 함께 index 값을 받고 싶다면 enumerated 연산자를 사용하자
 */
