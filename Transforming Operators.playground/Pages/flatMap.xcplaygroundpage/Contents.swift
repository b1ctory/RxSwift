import RxSwift

/*
 
 ๐ถโ๐ซ๏ธ flatMap์ Observable์์ ๋ฐฉ์ถ๋๋ ์์๋ฅผ ๊ฐ์ง๊ณ  ์๋ก์ด ์์๋ค์ ๋ฐฉ์ถ์ํค๋ Observable์ ๋ง๋  ํ ๊ตฌ๋์์๊ฒ ๋๊ฒจ์ฃผ๋ ์ฐ์ฐ์
 
 ๐คฉ 2์ด๋ง๋ค ์์๋ฅผ ๋ฐฉ์ถํ๋ Observable์์ flatMap์ ์ด์ฉํด์ 3์ด๋ง๋ค ๋ค๋ฅธ ์์๋ฅผ ๋ฐฉ์ถํ๋ Observable์ ์์ฑํ์ฌ ์ต์ข์ ์ผ๋ก ํ๋์ ๊ตฌ๋์์๊ฒ ์์๋ค์ด ๋ชจ๋ ๋์ด๊ฐ๋์ง ํ์ธํ๋ ์๋๋ฆฌ์ค
 
 */

/// ๐ take(3)์ผ๋ก ์ธ๊ฐ๋ก ์ ํ์ํจ 2์ด๋ง๋ค ์์๋ฅผ ๋ฐฉ์ถ์ํค๋ Observable
//Observable<Int>.timer(.seconds(0), period: .seconds(2), scheduler: MainScheduler.instance)
//    .take(3)

/*
 
 ๐ค interval์ period๋ฅผ 2์ด๋ก ์ค์ ํด์ฃผ๋ฉด ์ด๋ฐ 2์ด๋ฅผ ์ฌ๊ณ  ์ง์ํ๊ธฐ ๋๋ฌธ์ ์ํ๋ ๊ทธ๋ฆผ๊ณผ ๋ค๋ฅผ ์ ์๊ธฐ ๋๋ฌธ์ ์์ํ๋ ์๊ฐ์ ํจ๊ป ์ค์ ํ  ์ ์๋ timer๋ฅผ ์ฌ์ฉํ ๊ฒ!
 ๐ ๋ค์์ ์๊ฐํ๋ฅผ ์ํ Shape ์ด๊ฑฐํ
 
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

/// ๐ฅณ flatMap์ ๊ฐ์ง๊ณ  2๊ฐ์ ๋ค์ด์๋ชฌ๋๋ฅผ 3์ด์ ํ๋ฒ์ฉ ๋ฐฉ์ถ์ํค๋ Observable์ ๋ง๋ค์ด์ ๋ฆฌํด
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
 
 [๊ฒฐ๋ก ]
 ๐ฏ ํ๋์ Observable๋ก๋ถํฐ ๋ฐฉ์ถ๋๋ ์์๋ฅผ ๊ฐ์ง๊ณ  ์๋ก์ด Observable์ ๋ง๋ค๊ณ  ๊ทธ๊ฒ์ ํํํ์์ผ์ ์ฌ์ฉํ๊ณ  ์ถ๋ค๋ฉด flatMap ์ ์ฌ์ฉํ์!
 
 */
