import RxSwift

/*
 
 🍅 reduce의 파라메터 seed는 초기값을 의미하는데, 이 초기값이 필요한 이유는 가장 처음 연산 때 기준점이 없기 때문에 임의로 값을 주어야 하는 것이다.
 🍊 그리고 accumulator 클로저의 파라메터로는 누적되어 계산된 값, 그리고 현재의 값을 제공한다.
 
 */

let disposeBag = DisposeBag()

Observable.of(1, 2, 3)
    .reduce(0) { lsh, rsh in
        return lsh + rsh
    }.subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 
 🍋 Observable 시퀀스 마지막에 꼭 onCompleted 가 호출이 되어야 reduce로 연산된 값이 구독자에게 넘어간다!
 🍏 최종적으로 누적되어서 계산된 값을 구독자에게 전달해주어야 하는데, 만약 observable이 끝나지 않으면 더 받을 값이 있는지 없는지 모르기 때문이다.
 
 [결론]
 🐯 기존 Swift Collection type에서 제공하는 reduce 연산자를 그대로 같은 이름으로 rx에서도 사용할 수 있다.
 🐯 다만, 모든 요소가 방출되어야 reduce가 작동 시작하기 때문에 onCompleted 이벤트가 반드시 방출되어야 한다.
 
 */
