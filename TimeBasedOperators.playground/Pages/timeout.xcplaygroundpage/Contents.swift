import RxSwift

/*

 🐿 timeout은 내가 설정한 시간동안 아무런 요소가 방출되지 않으면 그대로 Observable 시퀀스를 종료하도록 만드는 연산자이다.
 🦦 로딩 시간 초과 등의 처리를 해줄 수 있당!
 🦫 timeout에 인자값으로 정해준 시간동안 아무런 요소가 전달되지 않으면 error를 방출시키고 Observable은 disposed된다.
 🐀 dueTime : 요소가 방출되기까지 얼마나 기다릴 것인지를 설정
 🦝 schedular : 어떤 스레드에서 코드를 실행시킬 것인지 정해주는 파라메터
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<Int> {
    return Observable.create { observer in
        observer.onNext(1)
        
        return Disposables.create()
    }
}

observable()
    .delay(.seconds(10), scheduler: MainScheduler.instance)
    .timeout(.seconds(5), scheduler: MainScheduler.instance)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

// 아래와같이 구현하면 timeoutError가 방출되어도 에러를 방출시키지 않고 구독자에게 기본값을 전달한다.
observable()
    .debug()
    .timeout(.seconds(5), scheduler: MainScheduler.instance)
    .catchAndReturn(-1)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 
 🍄 API를 요청하거나 할 때 시간이 너무 오래걸리면 기본값을 전달해주거나 할 때 유용하게 사용할 수 있다.
 
 [결론]
 🐯 Observable을 구독하고서 일정 시간동안 응답이 없는 경우를 처리하고 싶다면 timeout 연산자를 사용
 🐯 timeout으로 인한 에러 대신에 기본값을 전달하고 싶다면 .catchErrorJustReturn()
 
 */
