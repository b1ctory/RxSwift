import RxSwift

/*
 
 ๐งธ distinctUntilChanged ์ฐ์ฐ์๋ RxSwift6์ ์๋ก์ด ๊ธฐ๋ฅ์ผ๋ก, ์ค๋ณต๋์ด ๋ฐฉ์ถ๋ ๊ฐ๋ค์ ๋ฑ ํ๋์ฉ๋ง ๋ฐ์์์ฃผ๋ ์ฐ์ฐ์์ด๋ค. ์๋ฅผ ๋ค์ด 1,1,1,2,2,2 ์ด๋ ๊ฒ ์์๊ฐ ๋ฐฉ์ถ๋์๋ค๋ฉด 1,2 ๊ฐ ํ ๋ฒ์ฉ๋ง ๋ฐ์์ค๋ ๊ฒ์ด๋ค.
 
 */

let disposeBag = DisposeBag()

var observable = Observable.of(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)

/*
 
 [์คํ ๊ฒฐ๊ณผ]
 1 ๋ฐฉ์ถ!
 2 ๋ฐฉ์ถ!
 3 ๋ฐฉ์ถ!
 4 ๋ฐฉ์ถ!

 */
observable.distinctUntilChanged()
    .subscribe(onNext: { element in
        print("\(element) ๋ฐฉ์ถ!")
    }).disposed(by: disposeBag)

/*
 [๊ฒฐ๋ก ]
 ๐ฏ Observable์์ ์ฐ์์ ์ผ๋ก ์ค๋ณต๋์ด ๋ฐฉ์ถ๋๋ ์์๋ค์ ํ ๋ฒ๋ง ๊ตฌ๋์์๊ฒ ์ ๋ฌํด์ฃผ๊ณ  ์ถ๋ค๋ฉด distinctUntilChanged ์ฐ์ฐ์๋ฅผ ์ฌ์ฉํ์!
 */
