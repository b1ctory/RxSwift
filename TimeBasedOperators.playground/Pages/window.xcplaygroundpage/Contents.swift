import RxSwift

/*
 
 🐔 window 연산자는 buffer와 같이 여러 요소들을 묶어서 한 번에 구독자에게 전달해주는데 [1, 2, 3] 이렇게 전달해주지 않고 Observable로서 전달해주는 연산자
 🦊 window에서는 [1, 2, 3] 이렇게 묶어주던 것을 Observable.of(1, 2, 3) 이렇게 전달해주는 것이라고 생각하면 된다.
 🐤 window의 파라메터도 buffer의 파라메터들과 모두 동일하다.
 
 */
let disposeBag = DisposeBag()
let timerOb = Observable<Int>.timer(.seconds(0), period: .seconds(1), scheduler: MainScheduler.instance)

timerOb.window(timeSpan: .seconds(3),
               count: 2,
               scheduler: MainScheduler.instance)
    .subscribe(onNext: { newObservable in
        print("New stream started")
        newObservable.subscribe(onNext: { element in
            print(element)
        }).disposed(by: disposeBag)
    }).disposed(by: disposeBag)

/*
 
 [결론]
 🐯 요소들을 묶어서 또다른 Observable로 처리할 일이 있다면 buffer 대신 window를 사용하자
 🐯 buffer가 [0, 1] 이렇게 요소들을 묶어서 구독자에게 전달했다면 window는 Observable.of(0, 1) 이렇게 구독자에게 전달해준다.
 
 */
