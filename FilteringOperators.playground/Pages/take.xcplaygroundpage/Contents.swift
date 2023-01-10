import RxSwift

/*
 
 ❄️ take는 Observable에서 방출될 요소들에 대해 몇가지만 가져오겠다 할 때 사용되는 연산자이다.
 ☃️ take는 count 만큼의 element를 가져온다.
 ☀️ take에 파라메터로 준 값 이후에 방출되는 값들은 모두 무시된다.
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<String> {
    return Observable.create { observer in
        observer.onNext("☀️")
        observer.onNext("🌤")
        observer.onNext("🌧")
        observer.onNext("☃️")
        observer.onNext("☔️")
        observer.onCompleted()
        
        return Disposables.create()
    }
}

/*
 [출력 결과]
 ☀️ 뾰롱
 🌤 뾰롱
 🌧 뾰롱
 */
observable().take(3)
    .subscribe(onNext: { element in
        print("\(element) 뾰롱")
    }).disposed(by: disposeBag)

/*
 [결론]
 🐯 만약 Observable 시퀀스에서 방출되는 요소들을 n개로 제한하고 싶은 경우 take(count: n)으로 제한!
 */
