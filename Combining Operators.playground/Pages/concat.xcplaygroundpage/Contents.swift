import RxSwift

/*
 
 🐶 concat은 두 개 혹은 여러개의 Observable을 연결해주는 역할의 연산자
 🐱 마치 기차처럼 여러개의 Observable을 연속적으로 연결해준다.
 
 */

let disposeBag = DisposeBag()

let first = Observable.of(1, 2, 3)
let second = Observable.of(4, 5, 6)
let third = Observable.of(7, 8, 9)
let fourth = Observable.of(10, 11, 12)

first.concat(second)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 [출력 결과]
 1
 2
 3
 4
 5
 6
 */

// 🐭 한 번에 여러 Observable concat도 가능
Observable.concat(first, second, third, fourth)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 [출력 결과]
 1
 2
 3
 4
 5
 6
 4
 5
 6
 7
 8
 9
 10
 11
 12
 
 🐹 concat 시킬 요소들의 타입과 기존 Observable에서 예상하고 있는 타입이 같아야 한다.
 🐰 즉, first 요소 타입과 second 요소 타입이 일치해야 한다.
 🦊 만약 서로 타입이 다르게 되면 에러가 발생한다. 물론 Int와 String 두 가지 타입을 동등하게 사용하고 싶다면 Any 타입을 사용하면 됨!
 
 [결론]
 🐯 단순히 여러개의 Observable을 이어붙이고 싶을 때는 concat 연산자를 사용하자
 🐯 기본적으로 concat 대상이 되는 Observable의 타입과 기존 Observable의 타입이 일치해야 한다.
 
 */
