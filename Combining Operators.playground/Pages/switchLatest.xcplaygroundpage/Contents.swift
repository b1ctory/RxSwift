import RxSwift

/*
 
 🦄 switchLatest는 연산자 이름에서도 알 수 있듯이 각 Observable들을 구독한 상태에서 이 Observable 저 Observable을 switch 시키면서 요소를 전달받을 수 있도록 도와주는 연산자이다.
 
 */

let disposeBag = DisposeBag()

let first = PublishSubject<String>()
let second = PublishSubject<String>()
let source = PublishSubject<Observable<String>>()

source.switchLatest()
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

source.onNext(first)
first.onNext("1 I'm from first")
source.onNext(second)
second.onNext("100 I'm from second")

/*
 
 [결론]
 🐯 다수의 Observable을 교체하면서 요소를 전달받고 싶을 때 switchLatest를 사용하자
 
 */
