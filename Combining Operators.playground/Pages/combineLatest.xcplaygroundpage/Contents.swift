import RxSwift

/*
 
 🦊 각 Observable에서 방출되는 요소들 중 가장 최근 요소들끼리 결합해서 구독자에게 전달해주는 연산자
 
 */

let disposeBag = DisposeBag()

// 🐻 Observable 을 사용하지 않고 PublishSubject를 사용하는 이유는 원하는 시점에 요소 방출을 위함임
let first = PublishSubject<Int>()
let second = PublishSubject<Int>()

Observable.combineLatest(first, second)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

first.onNext(1)
second.onNext(3)
second.onNext(4)
first.onNext(2)
second.onNext(5)
first.onNext(3)

print("---------------------")

// 튜플 형식 말고 각각 따로 받을 수도 있다!
Observable.combineLatest(first, second)
    .subscribe(onNext: { left, right in
        print("\(left) and \(right)")
    }, onCompleted: {
        print("onCompleted")
    }).disposed(by: disposeBag)

first.onNext(1)
second.onNext(3)
second.onNext(4)
first.onNext(2)
second.onNext(5)
first.onNext(3)

/*
 [결론]
 🐯 현재 방출된 요소와 다른 Observable에서 방출된 최종값을 비교하고 싶은 일이 있다면 combineLatest를 사용하도록 하자
 */
