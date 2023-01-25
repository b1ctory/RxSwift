import RxSwift

/*
 
 🦞 throttle 연산자는 방출되는 요소를 받는 간격을 조절해주는 연산자
 🦁 정한 시간 동안은 아무리 요소가 방출된다고 해도 지정된 시간 동안은 전달 X
 🐱 파라메터
    🐢 dueTime : Observable로부터 요소가 방출된 직후 dueTime으로 설정한 시간동안 아무리 요소가 방출되어도 구독자에게 요소를 전달하지 않게된다.
    🐬 latest : latest가 true로 설정되면 dueTime으로 설정한 시간 동안 방출된 요소들 중 가장 최신 요소를 dueTime이 끝난 직후 구독자에게 전달한다. (기본값은 false)
    🐷 schedular : 코드를 어떤 스레드에서 실행시킬 것인지 정해준다.
 
 */

let disposeBag = DisposeBag()
let timerObservable = Observable<Int>.timer(.seconds(0), period: .seconds(1), scheduler: MainScheduler.instance)

timerObservable.throttle(.seconds(3), scheduler: MainScheduler.instance)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)


/*
 
 [출력결과]
 0
 3
 6
 9
 12
 ...
 
 🦄 어떤 버튼 클릭하는 액션에 대한 처리를 할 때, 다중 클릭에 대해서는 무시하고 첫번째 클릭 액션에 대해서만 대응하고 싶다면 throttle을 이용하면 이후 무시 가능하다. (무의미한 클릭 block)
 
 [결론]
 🐯 Observable로부터 요소를 전달받고서 일정 시간동안 요소를 받지 않고싶다면 throttle을 사용하자
 
 */
