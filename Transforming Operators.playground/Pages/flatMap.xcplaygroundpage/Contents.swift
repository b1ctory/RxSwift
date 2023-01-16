import RxSwift

/*
 
 😶‍🌫️ flatMap은 Observable에서 방출되는 요소를 가지고 새로운 요소들을 방출시키는 Observable을 만든 후 구독자에게 넘겨주는 연산자
 
 🤩 2초마다 요소를 방출하는 Observable에서 flatMap을 이용해서 3초마다 다른 요소를 방출하는 Observable을 생성하여 최종적으로 하나의 구독자에게 요소들이 모두 넘어가는지 확인하는 시나리오
 
 */

/// 😎 take(3)으로 세개로 제한시킨 2초마다 요소를 방출시키는 Observable
//Observable<Int>.timer(.seconds(0), period: .seconds(2), scheduler: MainScheduler.instance)
//    .take(3)

/*
 
 🤓 interval은 period를 2초로 설정해주면 초반 2초를 쉬고 진입하기 때문에 원하는 그림과 다를 수 있기 때문에 시작하는 시간을 함께 설정할 수 있는 timer를 사용한 것!
 😙 다음은 시각화를 위한 Shape 열거형
 
 */

enum Shape: Int {
    case 🔵 = 0
    case 🔴 = 1
    case 🟠 = 2
    
    var diamond: String {
        switch self {
        case .🔵:
            return "🔷"
        case .🔴:
            return "♦️"
        case .🟠:
            return "🔶"
        }
    }
}

let disposeBag = DisposeBag()

/// 🥳 flatMap을 가지고 2개의 다이아몬드를 3초에 한번씩 방출시키는 Observable을 만들어서 리턴
Observable<Int>.timer(.seconds(0), period: .seconds(2), scheduler: MainScheduler.instance)
    .take(3)
    .flatMap( { element in
        return Observable<Int>.timer(.seconds(0), period: .seconds(3), scheduler: MainScheduler.instance)
            .take(2)
            .map { innerElement in
                return "\(Shape(rawValue: element)!.diamond)"
            }
    }).subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 
 [결론]
 🐯 하나의 Observable로부터 방출되는 요소를 가지고 새로운 Observable을 만들고 그것을 평탄화시켜서 사용하고 싶다면 flatMap 을 사용하자!
 
 */
