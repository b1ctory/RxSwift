import RxSwift

/*
 🦦 elementAt 연산자는 내가 n번째 요소만 받고싶을 때 유용한 연산자이다.
 🦭 요소는 0번 인덱스부터 채워짐을 유의하자.
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<String> {
    return Observable.create { observer in
        observer.onNext("🦦")
        observer.onNext("🦈")
        observer.onNext("🐳")
        observer.onNext("🐬")
        observer.onNext("🦭")
        observer.onCompleted()
        
        return Disposables.create()
    }
}

/*
 [실행 결과]
 🐬
 Completed !
 */
observable().element(at: 3)
    .subscribe(onNext: { element in
        print(element)
    }, onCompleted: {
        print("Completed !")
    }).disposed(by: disposeBag)

/*
 [결론]
 🐯 Observable에서 방출되는 요소들 중 원하는 n번째의 요소만 받고 싶다면 element(at: n)을 사용해서 받자!
 */
