import RxSwift

/*
 
 ⛑ interval은 일정 주기마다 요소를 반복 방출 시켜주는 연산자
 🧶 period로 설정해준 시간만큼 대기하다가 요소를 방출시킨다.라고도 설명 가능하다.
 
 */

let disposeBag = DisposeBag()

// period : 몇 초 간격으로 요소 방출? / scheduler : 어떤 스레드에서 코드 실행?
Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 
 🧥 여기서 방출되는 요소들은 "초" 가 아니라 인덱스 값이다.
 🧤 따라서 interval을 1초마다가 아닌 2초마다로 해도 방출되는 시간만 다를 뿐 요소의 값은 0, 1, 2 ... 로 동일하다.
 👖 그리고 interval은 disposed 되면 카운팅이 중단된다.
 🌂 period로 준 시간만큼 처음부터 대기했다가 요소를 방출시키기 때문에 요소를 전달받고 싶은 경우에는 timer를 사용하자!
 
 [결론]
 🐯 Observable에서 일정 시간마다 요소를 방출시키고 싶다면 interval을 사용!
 🐯 다만 interval에서 설정해준 시간만큼 처음부터 대기하기 때문에 즉시 요소를 방출시키고 싶다면 timer를 이용하자!
 
 */
