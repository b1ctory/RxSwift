import RxSwift

/*
 
 🚗 buffer는 Observable에서 방출되는 요소들을 몇개씩 묶어서 구독자들에게 전달해주도록 도와주는 연산자이다.
 🚚 그냥 묶어주는건 아니고 buffer에 몇가지 파라메터들이 있어서 그 조건에 맞으면 구독자에게 전달해주게 된다.
 🚜 count : 몇 개의 요소들을 묶어서 구독자에게 전달해줄 것인지 결정해주는 파라메터이다. 요소들이 count 만큼 누적되면 그대로 묶여서 구독자에게 전달된다.
 🚛 timeSpan : timeSpan은 요소들을 받을 대기시간을 설정해주는 파라메터이다.
    🚎 만약, timeSpan을 3초로 설정하고 count를 2개로 설정했는데 3초동안 2개의 요소들이 모이지 않으면 그대로 구독자들에게 전달되는 것.
    🚓 또한, timeSpan으로 설정한 시간동안 count 만큼의 요소들이 모였다면 그대로 요소들을 묶어서 구독자에게 전달하고 timeSpan으로 지정한 시간을 다시 count 한다.
 🚐 schedular : 해당 코드가 실행될 스레드를 정해주는 파라메터
 
 */

let disposeBag = DisposeBag()
let timerOb = Observable<Int>.timer(.seconds(0), period: .seconds(1), scheduler: MainScheduler.instance)

timerOb.buffer(timeSpan: .seconds(3),
               count: 2,
               scheduler: MainScheduler.instance)
            .subscribe(onNext: { element in
                print(element)
            }).disposed(by: disposeBag)

/*
 
 [결론]
 🐯 요소들을 몇개씩 묶어서 구독자에게 전달하고 싶다면 buffer!
 
 */
