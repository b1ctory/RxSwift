import RxSwift

/*
 
 🐘 skip은 onNext로 전달받은 element를 건너뛰어주는 연산자이다.
 🐢 skip() 연산자는 int 값을 파라메터로 받는데, 이는 몇 번 건너뛸지를 묻는 것이다.
 🐑 예를 들어 skip(1) 이라면 한 번 요소를 구독자에게 전달해주지 않다가 그 뒤로는 전달한다.
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<Int> {
    return Observable.create { observer in
        observer.onNext(1)
        observer.onNext(2)
        observer.onNext(3)
        observer.onCompleted()
        
        return Disposables.create()
    }
}

// 실행 결과 : 3 방출!
observable().skip(2)
    .subscribe(onNext: { element in
        print("\(element) 방출!")
    }).disposed(by: disposeBag)

// 🦮 여러개의 연산자들은 subscribe 하기 전에 섞어서 사용할 수도 있다.
observable().skip(2)
    .filter { $0 > 2 }
    .subscribe(onNext: { element in
        print("skip과 filter을 거친 \(element) 방출!")
    }, onCompleted: {
        print("Completed !")
    }).disposed(by: disposeBag)

/*
 [결론]
 🐯 0 ~ n개까지 처음 방출되는 요소들을 구독자에게 전달시키고싶지 않다면 skip 연산자를 이용하자!
 */
