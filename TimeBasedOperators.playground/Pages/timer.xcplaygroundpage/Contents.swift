import RxSwift

/*
 
 🏓 timer 연산자는 interval 연산자와 같이 일정 주기마다 요소 (index값)를 방출시키는 연산자이다.
 🏀 다만, timer의 경우 interval과 달리 시작 지점을 설정해줄 수 있다.
 🥎 timer는 interval과 다르게 요소를 방출시키는 것이 유한할 수 있다. (interval은 무한)
 🪀 왜냐하면 period를 옵셔널로 받고 있기 때문이다.
 🥏 만약 period 파라메터에 아무 값을 주지 않으면 dueTime으로 설정한 시간 후에 0을 방출하고 그대로 종료되어 버리기 때문이다.
 🪁 아래의 예제는 요소 방출까지 3초를 대기했다가 1초마다 요소를 방출시키는 timer이다.
 
 */

let disposeBag = DisposeBag()

Observable<Int>.timer(.seconds(3), period: .seconds(1), scheduler: MainScheduler.instance)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 
 [결론]
 🐯 일정 시간동안 대기했다가 일정 주기마다 요소를 방출시키고 싶다면 interval + delay 대신 timer를 사용하자
 
 */
