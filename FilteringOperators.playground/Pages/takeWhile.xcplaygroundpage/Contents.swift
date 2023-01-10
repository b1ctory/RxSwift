import RxSwift

/*
 
 👻 takeWhile은 ~ 할 때까지 take 하라는 의미를 가진 연산자이다.
 🫶🏼 take(while:) 도 skip(while:)과 마찬가지로 조건을 작성해주어야 한다.
 👶🏻 여기서 true가 리턴되면 take하고, false가 리턴되면 그 시점부터는 더이상 방출되는 element는 넘겨주지 않는 것이다.
 
 */

let disposeBag = DisposeBag()

func sushiRail() -> Observable<String> {
    return Observable.create { observer in
        observer.onNext("새우초밥")
        observer.onNext("계란초밥")
        observer.onNext("연어초밥")
        observer.onNext("🪰")
        observer.onNext("광어초밥")
        observer.onNext("장어초밥")
        
        return Disposables.create()
    }
}


/*
 [실행 결과]
 새우초밥 냠냠
 계란초밥 냠냠
 연어초밥 냠냠
 */
sushiRail().take(while: { sushi in
    return sushi != "🪰"
}).subscribe(onNext: { sushi in
    print("\(sushi) 냠냠")
}).disposed(by: disposeBag)

/// 축약 표현식
sushiRail().take(while: {
    $0 != "🪰"
}).subscribe(onNext: { sushi in
    print("\(sushi) 냠냠")
}).disposed(by: disposeBag)

/*
 [결론]
 🐯 단순히 몇 개 까지의 요소만 받는 연산자가 take라면, 원하는 조건에 맞는 요소들 까지만 받을 수 있도록 도와주는 연산자는 takeWhile 이다.
 🐯 takeWhile의 특징은 조건식에서 true가 리턴되는 동안은 계속해서 요소를 받다가 false가 리턴되는 즉시 그 후의 모든 요소들을 구독자에게 넘겨주지 않는다는 것이다.
 🐯 skipWhile이나 takeWhile 그리고 filter 등 각 연산 클로저에서 리턴해주는 Boolean 값에 따라서 값을 전달해주거나 전달해주지 않는 경우가 헷갈릴 수 있으니 주의하자!
 */
