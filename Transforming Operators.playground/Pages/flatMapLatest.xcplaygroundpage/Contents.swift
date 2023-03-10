import RxSwift

/*
 ๐ฉ๐ปโโค๏ธโ๐จ๐ป flatMapLatest๋ flatMap๊ณผ ๋์ผํ๊ฒ Observable์์ ๋ฐฉ์ถ๋ ์์๋ฅผ ๊ฐ์ง๊ณ  ์๋ก์ด Observable์ ์์ฑํ๊ณ  ์๋ก์ด Observable์์ ๋ฐฉ์ถ๋๋ ์์๋ฅผ ์ต์ข์ ์ผ๋ก ๊ตฌ๋์๊ฐ ๋ฐ๋๊ฒ ๊น์ง๋ ๊ฐ์๋ฐ,
 ๐ง๐ปโโ๏ธ ์๋ฅผ๋ค์ด ์๋ก์ด Observable1, ์๋ก์ด Observable2 ์ด๋ ๊ฒ ๊ฐ ๋ง๋ค์ด์ก์ ๋ Obervable1์์ ์์๊ฐ ๋ฐฉ์ถ ๋๋ค๊ฐ Observable2์์ ์์๊ฐ ๋ฐฉ์ถ๋๊ธฐ ์์ํ๋ฉด Observable1๋ ์ข๋ฃ๋๊ฒ ๋๋ ๊ฒ
 */

enum Shape: Int {
    case ๐ต = 0
    case ๐ด = 1
    case ๐  = 2
    
    var diamond: String {
        switch self {
        case .๐ต:
            return "๐ท"
        case .๐ด:
            return "โฆ๏ธ"
        case .๐ :
            return "๐ถ"
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
 [์ถ๋ ฅ ๊ฒฐ๊ณผ]
 ๐ท
 โฆ๏ธ
 ๐ถ
 ๐ถ

 [๊ฒฐ๋ก ]
 ๐ฏ flatMap์ ์ฌ์ฉํ๋ ์ต์ ๊ฐ๋ค๋ง ํ์ธํ๊ณ  ์ถ๋ค ํ  ๋ flatMapLatest๋ฅผ ์ฌ์ฉํ์!
 */
