import RxSwift

/*
 
 🧸 distinctUntilChanged 연산자는 RxSwift6의 새로운 기능으로, 중복되어 방출된 값들을 딱 하나씩만 받아와주는 연산자이다. 예를 들어 1,1,1,2,2,2 이렇게 요소가 방출되었다면 1,2 각 한 번씩만 받아오는 것이다.
 
 */

let disposeBag = DisposeBag()

var observable = Observable.of(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)

/*
 
 [실행 결과]
 1 방출!
 2 방출!
 3 방출!
 4 방출!

 */
observable.distinctUntilChanged()
    .subscribe(onNext: { element in
        print("\(element) 방출!")
    }).disposed(by: disposeBag)

/*
 [결론]
 🐯 Observable에서 연속적으로 중복되어 방출되는 요소들을 한 번만 구독자에게 전달해주고 싶다면 distinctUntilChanged 연산자를 사용하자!
 */
