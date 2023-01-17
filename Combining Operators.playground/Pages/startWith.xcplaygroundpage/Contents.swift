import RxSwift

/*
 
 🫣 어떤 Observable을 구독하고 요소를 방출 받을 때 시작값을 정해줄 수 있도록 해주는 연산자
 
 */

var disposeBag = DisposeBag()

// 💀 시작과 동시에 startWith 값이 넘어오는지 확인하기 위해 요소들 방출을 구독 후 3초 뒤에 전달받을 수 있도록 표현한 Observable
func observable() -> Observable<Int> {
    return Observable.create { observer in
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
        }
        
        return Disposables.create()
    }
}

observable().startWith(0)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 
 [실행 결과]
 0
 1
 2
 3
 
 🫰🏻 이런식으로 주로 초기값이 필요한 경우 startWith를 사용한다.
 🤟🏻 예를 들면 API를 통한 데이터를 가져오기 전에 placeholder로서 사용할 텍스트 등이나 기타 데이터를 startWith를 통해 방출해준다던지 할 때 유용하게 사용 가능하다.
 
 [결론]
 🐯 Observable이 구독되는 시점에 구독자에게 초기값을 전달해주고 싶다면 startWith !
 
 */
