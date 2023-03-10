import RxSwift

/*
 
 ๐ฆ array๋ฅผ for loop ๋๋ฆฌ๋ฉด์ index ๊ฐ์ ๊ฐ์ด ๋ฐ์์ค๊ณ  ์ถ์ ๋ enumerated๋ฅผ ์ฃผ๋ก ์ฌ์ฉํ๋ค.
 ๐ฆ RxSwift์์์ enumerated ๋ํ index ๊ฐ์ ๊ฐ์ด ๋ฐ์์ค๊ณ  ์ถ์ ๊ฒฝ์ฐ์ ์ฌ์ฉ๋๋ ์ฐ์ฐ์์ด๋ค.
 
 */

var disposeBag = DisposeBag()

func observable() -> Observable<String> {
    return Observable.create { observer in
        observer.onNext("๐ก")
        observer.onNext("๐ ")
        observer.onNext("๐")
        observer.onNext("๐ฌ")
        observer.onCompleted()
        
        return Disposables.create()
    }
}

// ๐ ๊ทธ๋ฆฌ๊ณ  subscribe ํ๊ธฐ ์ ์ enumerated ์ฐ์ฐ์๋ฅผ ํธ์ถํด์ฃผ๊ณ  subscribe ํด๋ก์  ํ๋ผ๋ฉํฐ์ (index, element) ์ด๋ ๊ฒ ์ ์ธํด์ฃผ๊ณ  ์ฌ์ฉํ๋ฉด ๋๋ค!
observable().enumerated()
    .subscribe(onNext: { index, element in
        print("\(element) at \(index)")
    }).disposed(by: disposeBag)

/*
 [๊ฒฐ๋ก ]
 ๐ฏ ์์์ ํจ๊ป index ๊ฐ์ ๋ฐ๊ณ  ์ถ๋ค๋ฉด enumerated ์ฐ์ฐ์๋ฅผ ์ฌ์ฉํ์
 */
