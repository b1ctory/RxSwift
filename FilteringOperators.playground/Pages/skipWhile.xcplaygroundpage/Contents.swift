import RxSwift

/*
 
 ✈️ skipWhile은 조금 더 구체적인 조건으로 요소들을 skip 시킬 수 있게 도와주는 연산자이다.
 🛫 skipWhile에 선언되어있는 조건문에 충족되면 skip, 그리고 그 조건을 벗어내는 요소가 방출되자마자 그 이후에는 조건에 관계없이 모든 요소들을 구독자들에게 전달한다.
 🛬 즉, '~할 때까지는 skip 하고, ~하지 않으면 그 때부터 받겠다!' 라는 뜻이다.
 
 */

let disposeBag = DisposeBag()

func sushiRail() -> Observable<String> {
    return Observable.create { observer in
        observer.onNext("새우초밥")
        observer.onNext("계란초밥")
        observer.onNext("연어초밥")
        observer.onNext("모듬튀김")
        observer.onNext("광어초밥")
        observer.onNext("장어초밥")
        
        return Disposables.create()
    }
}

sushiRail().skip(while: { sushi in
    return sushi != "연어초밥"
}).subscribe(onNext: { sushi in
    print("\(sushi) 냠냠 🍣")
}).disposed(by: disposeBag)

/*
 ⚠️ filter 클로저에서는 true가 리턴되게 되면 구독자에게 element를 넘겨주고 false인 경우 요소를 무시한다.
 ⚠️ 그러나 skip(while:) 에서는 true가 리턴되면 skip된다는 차이점을 항상 유의하자!
 
 [결론]
 🐯 초기 어떤 값에 해당하는 값을 받을 때까지 Observable에서 방출되는 요소들을 모두 무시하고 싶다면 skipWhile을 사용하자!
 */
