import RxSwift

/*
 
 🐰 flatMap과 비슷하면서도 concat만의 성질을 지닌 연산자이다.
 🦊 concat의 특징은 "순서를 보장해준다." 이다. (flatMap과의 차이점이기도 함)
 
 */

let disposeBag = DisposeBag()

// 0.5초마다 요소를 방출시키고 두 개로 제한함
//Observable<Int>.timer(.seconds(0), period: .milliseconds(500), scheduler: MainScheduler.instance)
//    .take(2)

enum Shape: Int {
    case 🔵 = 0
    case 🔴 = 1
    
    var diamond: String {
        switch self {
        case .🔵:
            return "🔷"
        case .🔴:
            return "♦️" // <- 이거 빨간 다이아몬드 입니다..!!
        }
    }
}

Observable<Int>.timer(.seconds(0), period: .milliseconds(500), scheduler: MainScheduler.instance)
    .take(2)
    .concatMap { element in
        return Observable<Int>.timer(.seconds(0), period: .milliseconds(300), scheduler: MainScheduler.instance)
            .take(3)
            .map { _ in
                return "\(Shape(rawValue: element)!.diamond)"
            }
    }.subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 [결론]
 🐯 flatMap에 의해 새로 생성된 Observable의 순서를 보장해주고 싶다면 concatMap!
 */
