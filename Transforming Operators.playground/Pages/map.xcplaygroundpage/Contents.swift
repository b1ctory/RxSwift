import RxSwift

/*
 
 🐵 Rx에서 map은 Observable에서 작동한다는 점만 제외하면 Foundation에서 제공하는 map과 Rx에서 제공하는 map은 거의 동일하다.
 
 */

var disposeBag = DisposeBag()

func observable() -> Observable<Int> {
    return Observable.create { observer in
        observer.onNext(1)
        observer.onNext(2)
        observer.onNext(3)
        observer.onNext(4)
        observer.onCompleted()
        
        return Disposables.create()
    }
}

observable()
    .map { $0 * 2 }
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 [실행결과]
 2
 4
 6
 8

 🙈 기존 map에서도 그렇듯 단순히 중간에 간단한 계산이 필요할 때에도 많이 사용되지만 중간에 타입을 변환하는 일로도 유용하게 사용된다.
 🙉 예를 들어 CGFloat 타입으로 방출되는 요소들을 중간에 map을 사용해서 String으로 바꾸거나 Int 타입으로 바꿔주는 등 타입 변환을 시켜주는 것이다.
 🙊 그렇게되면 Observable을 구독하는 구독자는 CGFloat의 타입으로 요소를 받는 것이 아닌 map을 통해 변형된 타입으로 요소를 받는 것이니 따로 onNext에서 원하는 타입으로 변경해주는 전처리가 필요없이 바로 사용할 수 있는 것!
 */

struct Student {
    var name: String
    var grade: Int
}

func observableTwo() -> Observable<Student> {
    return Observable.create { observer in
        observer.onNext(Student(name: "joy", grade: 1))
        observer.onNext(Student(name: "james", grade: 2))
        observer.onNext(Student(name: "teresa", grade: 1))
        observer.onNext(Student(name: "pote", grade: 2))
        observer.onNext(Student(name: "boaz", grade: 3))
        observer.onNext(Student(name: "havier", grade: 3))
        
        return Disposables.create()
    }
}

observableTwo()
    .map { $0.grade }
    .subscribe(onNext: { grade in
        print("\(grade) grade")
    }).disposed(by: disposeBag)

/*
 
 [결론]
 Observable을 통해서 방출되는 모든 요소에 대해서 중간에 계산을 하거나 타입을 변경시켜주고 싶을 때 굳이 구독해서 계산하거나 타입을 변경하지 않고 map으로 간편하게 처리 가능하다.
 
 */
