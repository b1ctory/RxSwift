import RxSwift

/*
 
 ๐ถ concat์ ๋ ๊ฐ ํน์ ์ฌ๋ฌ๊ฐ์ Observable์ ์ฐ๊ฒฐํด์ฃผ๋ ์ญํ ์ ์ฐ์ฐ์
 ๐ฑ ๋ง์น ๊ธฐ์ฐจ์ฒ๋ผ ์ฌ๋ฌ๊ฐ์ Observable์ ์ฐ์์ ์ผ๋ก ์ฐ๊ฒฐํด์ค๋ค.
 
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
 [์ถ๋ ฅ ๊ฒฐ๊ณผ]
 1
 2
 3
 4
 5
 6
 */

// ๐ญ ํ ๋ฒ์ ์ฌ๋ฌ Observable concat๋ ๊ฐ๋ฅ
Observable.concat(first, second, third, fourth)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 [์ถ๋ ฅ ๊ฒฐ๊ณผ]
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
 
 ๐น concat ์ํฌ ์์๋ค์ ํ์๊ณผ ๊ธฐ์กด Observable์์ ์์ํ๊ณ  ์๋ ํ์์ด ๊ฐ์์ผ ํ๋ค.
 ๐ฐ ์ฆ, first ์์ ํ์๊ณผ second ์์ ํ์์ด ์ผ์นํด์ผ ํ๋ค.
 ๐ฆ ๋ง์ฝ ์๋ก ํ์์ด ๋ค๋ฅด๊ฒ ๋๋ฉด ์๋ฌ๊ฐ ๋ฐ์ํ๋ค. ๋ฌผ๋ก  Int์ String ๋ ๊ฐ์ง ํ์์ ๋๋ฑํ๊ฒ ์ฌ์ฉํ๊ณ  ์ถ๋ค๋ฉด Any ํ์์ ์ฌ์ฉํ๋ฉด ๋จ!
 
 [๊ฒฐ๋ก ]
 ๐ฏ ๋จ์ํ ์ฌ๋ฌ๊ฐ์ Observable์ ์ด์ด๋ถ์ด๊ณ  ์ถ์ ๋๋ concat ์ฐ์ฐ์๋ฅผ ์ฌ์ฉํ์
 ๐ฏ ๊ธฐ๋ณธ์ ์ผ๋ก concat ๋์์ด ๋๋ Observable์ ํ์๊ณผ ๊ธฐ์กด Observable์ ํ์์ด ์ผ์นํด์ผ ํ๋ค.
 
 */
