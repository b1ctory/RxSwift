import RxSwift

/*
 
 ๐ซฃ ์ด๋ค Observable์ ๊ตฌ๋ํ๊ณ  ์์๋ฅผ ๋ฐฉ์ถ ๋ฐ์ ๋ ์์๊ฐ์ ์ ํด์ค ์ ์๋๋ก ํด์ฃผ๋ ์ฐ์ฐ์
 
 */

var disposeBag = DisposeBag()

// ๐ ์์๊ณผ ๋์์ startWith ๊ฐ์ด ๋์ด์ค๋์ง ํ์ธํ๊ธฐ ์ํด ์์๋ค ๋ฐฉ์ถ์ ๊ตฌ๋ ํ 3์ด ๋ค์ ์ ๋ฌ๋ฐ์ ์ ์๋๋ก ํํํ Observable
func observable() -> Observable<Int> {
    return Observable.create { observer in
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
        }
        
        return Disposables.create()
    }
}

observable().startWith(0)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 
 [์คํ ๊ฒฐ๊ณผ]
 0
 1
 2
 3
 
 ๐ซฐ๐ป ์ด๋ฐ์์ผ๋ก ์ฃผ๋ก ์ด๊ธฐ๊ฐ์ด ํ์ํ ๊ฒฝ์ฐ startWith๋ฅผ ์ฌ์ฉํ๋ค.
 ๐ค๐ป ์๋ฅผ ๋ค๋ฉด API๋ฅผ ํตํ ๋ฐ์ดํฐ๋ฅผ ๊ฐ์ ธ์ค๊ธฐ ์ ์ placeholder๋ก์ ์ฌ์ฉํ  ํ์คํธ ๋ฑ์ด๋ ๊ธฐํ ๋ฐ์ดํฐ๋ฅผ startWith๋ฅผ ํตํด ๋ฐฉ์ถํด์ค๋ค๋์ง ํ  ๋ ์ ์ฉํ๊ฒ ์ฌ์ฉ ๊ฐ๋ฅํ๋ค.
 
 [๊ฒฐ๋ก ]
 ๐ฏ Observable์ด ๊ตฌ๋๋๋ ์์ ์ ๊ตฌ๋์์๊ฒ ์ด๊ธฐ๊ฐ์ ์ ๋ฌํด์ฃผ๊ณ  ์ถ๋ค๋ฉด startWith !
 
 */
