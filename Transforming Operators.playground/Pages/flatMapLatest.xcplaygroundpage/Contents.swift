import RxSwift

/*
 👩🏻‍❤️‍👨🏻 flatMapLatest는 flatMap과 동일하게 Observable에서 방출된 요소를 가지고 새로운 Observable을 생성하고 새로운 Observable에서 방출되는 요소를 최종적으로 구독자가 받는것 까지는 같은데,
 🧎🏻‍♀️ 예를들어 새로운 Observable1, 새로운 Observable2 이렇게 각 만들어졌을 때 Obervable1에서 요소가 방출 되다가 Observable2에서 요소가 방출되기 시작하면 Observable1는 종료되게 되는 것
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

Observable<Int>.timer(.seconds(0), period: .seconds(2), scheduler: MainScheduler.instance)
    .take(3)
    .flatMapLatest({ element in
        return Observable<Int>.timer(.seconds(0), period: .seconds(3), scheduler: MainScheduler.instance)
            .take(2)
            .map { innerElement in
                return "\(Shape(rawValue: element)!.diamond)"
            }
    }).subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 [출력 결과]
 🔷
 ♦️
 🔶
 🔶

 [결론]
 🐯 flatMap을 사용하되 최신값들만 확인하고 싶다 할 때 flatMapLatest를 사용하자!
 */
