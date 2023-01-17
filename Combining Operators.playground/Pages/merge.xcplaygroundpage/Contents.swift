import RxSwift
import RxCocoa

/*
 
 🐻 다수의 Observable에서 방출되는 요소들을 모두 병합시켜주는 연산자 merge
 🐼 두 Observable을 merge 하면 서로의 요소가 방출되는 시점도 유지시켜주면서 하나의 Observable로 병합되는 모습을 확인할 수 있다.
 🐻‍❄️ merge 같은 경우도 다른 연산자들과 같이 .merge() 로 호출해서 사용할 수 있고, static으로 정의되어 있기 때문에 Observabl.merge() 이렇게 호출해서 사용할 수도 있다.
 
 */

let disposeBag = DisposeBag()

let first = Observable.of("1🟦", "2🟦", "3🟦")
let second = Observable.of("4🟨", "5🟨", "6🟨")

Observable
    .merge(first, second)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

print("-----------------------------")

Observable.of(first, second)
    .merge()
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)



print("-----------------------------")

let firstSubject = PublishSubject<Int>()
let secondSubject = PublishSubject<Int>()

Observable.merge(firstSubject, secondSubject)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

firstSubject.onNext(1)
secondSubject.onNext(2)
firstSubject.onNext(3)
secondSubject.onNext(4)
firstSubject.onNext(5)
secondSubject.onNext(6)

/*
 
 🐯 maxConcurrent : 몇 개의 Observable을 병합시켜줄 건지 제한
 
 */
let subjectBlue = PublishSubject<String>()
let subjectYellow = PublishSubject<String>()
let subjectRed = PublishSubject<String>()

Observable.of(subjectBlue, subjectYellow, subjectRed)
    .merge(maxConcurrent: 2)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

subjectBlue.onNext("1🟦")
subjectRed.onNext("2🟥")
subjectYellow.onNext("3🟨")

subjectBlue.onNext("1🟦")
subjectRed.onNext("2🟥")
subjectYellow.onNext("3🟨")

subjectBlue.onCompleted()
subjectRed.onNext("4🟥")

/*
 
 🐮 다수의 Observable을 모두 병합시키는 것이다 보니 모든 Observable들이 onCompleted가 호출이 되어야지만 최종적으로 병합된 Observable도 onCompleted가 호출된다.
 🐷 만약 이를 인지하지 않고 onCompleted를 무시하면 메모리 누수 가능성
 🐧 꼭 모든 Observable들이 onCompleted되어야 하나로 병합된 Observable도 onCompleted된다!
 
 [결론]
 🐯 다수의 Observable을 병합하고 싶다면 merge 연산자를 이용해 간편하게 병합
 🐯 다수의 Observable들을 병합하게 되면 하나의 Observable 시퀀스에서 요소들을 관리하게 되는 것이니 모두 타입을 맞춰주자
 
 */
