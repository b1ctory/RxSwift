import RxSwift

/*
 
 🐱 CollectionType에서 사용되는 filter와 동일한 의미로서 사용된다.
 🐶 filter 연산자 안에 조건을 달아주면 그 조건에 따라 구독자가 받는 요소들이 걸러지게 되는 것이다.
 
 */

let disposeBag = DisposeBag()

func genderObservable() -> Observable<String> {
    return Observable.create { observer in
        observer.onNext("Mr.Kim")
        observer.onNext("Ms.Kim")
        observer.onNext("Mrs.Choi")
        observer.onNext("Mrs.Park")
        observer.onNext("Ms.Lee")
        observer.onNext("Mr.Choi")
        observer.onCompleted()
        
        return Disposables.create()
    }
}

/*
 [출력결과]
 Mrs.Choi
 Mrs.Park
 */
genderObservable().filter { name in
    return name.hasPrefix("Mrs.")
}.subscribe(onNext: { filteredGender in
    print(filteredGender)
}).disposed(by: disposeBag)

/// 위와 동일한 결과를 도출하는 축약 표현식이다.
genderObservable().filter {
    $0.hasPrefix("Mrs.")
}.subscribe(onNext: { filteredGender in
    print(filteredGender)
}).disposed(by: disposeBag)

/*
 🦊 subscribe로 구독하기 이전에 filter를 한번만 호출하라는 법은 없으니 다양한 조건을 filter로 나누어 걸러주어도 무방하다.
 
 [결론]
 🐯 Observalbe에서 방출되는 요소를 조건에 맞게 걸러서 구독자에게 전달해주고 싶다면 filter 연산자를 사용하자!
 */
