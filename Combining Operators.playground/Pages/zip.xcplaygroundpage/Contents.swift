import RxSwift

/*
 
 ๐ผ zip์ ์ฌ๋ฌ Observable์์ ๋ฐฉ์ถ๋๋ ์์๋ค์ ํ๋๋ก ๊ฒฐํฉํ์ฌ ๊ตฌ๋์์๊ฒ ์ ๋ฌํด์ฃผ๋ ์ฐ์ฐ์์ด๋ค.
 ๐ฆ ๊ฐ Observable์์ ์์๊ฐ ๋ฐฉ์ถ๋๊ณ  ์๋ก ์ง์ด ์๊ฒจ์ผ ๋น๋ก์ ๊ตฌ๋์์๊ฒ ๊ฒฐํฉ๋ ์ง์ ์ ๋ฌ์์ผ์ฃผ๋ ์ฐ์ฐ์์ด๋ค.
 ๐ปโโ๏ธ ๋ง์ฝ first์์ 3๊ฐ์ ์์๋ฅผ ๋ฐฉ์ถ์ํค๊ณ  second์์ 100๋ง๊ฐ์ ์์๋ฅผ ๋ฐฉ์ถ์์ผฐ๋ค๊ณ  ํด๋ ๊ตฌ๋์์๊ฒ๋ 3๊ฐ์ ์์๋ฐ์ ์ ๋ฌ๋์ง ์๋ ๊ฒ!
 
 */

let disposeBag = DisposeBag()

let first = PublishSubject<Int>()
let second = PublishSubject<Int>()

Observable.zip(first, second)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

first.onNext(1)
second.onNext(4)
second.onNext(5)
first.onNext(2)
second.onNext(6)
first.onNext(3)

print("---------------")

first.onNext(1)
first.onNext(2)
first.onNext(3)
first.onNext(4)
first.onNext(5)

second.onNext(1)

/*
 
 ๐ฅ ์ฌ๋ฌ Observable์ ๊ฒฐํฉํด์ ์ฌ์ฉํ๋ ๊ฒ์ด๊ธฐ ๋๋ฌธ์ ํ Observable์ด๋ผ๋ onCompleted ์ด๋ฒคํธ๊ฐ ๋ฐฉ์ถ๋์ง ์์ผ๋ฉด ๊ตฌ๋ํ๊ณ  ์๋ Observable์ด๋ผ๋ ๋ฉ๋ชจ๋ฆฌ ๋์ ๋ฐ์ํ  ์ ์์ผ๋ ์ฃผ์ํ  ๊ฒ!
 ๐ฃ ๋ํ ์ฌ๋ฌ Observable์ ์กฐํฉํ์ฌ ์ฌ์ฉํ๋ ๊ฒ์ด๊ธฐ ๋๋ฌธ์ ๊ฐ Observable์ด ๋ฐฉ์ถํ๋ ์์์ ํ์์ด ์ผ๊ด๋์ด์ผ ์ปดํ์ผ ๊ฐ๋ฅ
 
 [๊ฒฐ๋ก ]
 ๐ฏ ์ฌ๋ฌ Observable์์ ๋ฐฉ์ถ๋๋ ์์๋ค์ ์ง์ง์ด ๊ตฌ๋์์๊ฒ ์ ๋ฌํ๊ณ  ์ถ๋ค๋ฉด zip
 ๐ฏ ๊ฐ ๊ฒฐํฉ๋ Observable๋ค์์ ๋ชจ๋ onCompleted ์ด๋ฒคํธ๊ฐ ๋ฐฉ์ถ๋์ด์ผ ๊ฒฐํฉ์ํจ Observable์์๋ onCompleted์ด๋ฒคํธ๊ฐ ๋ฐฉ์ถ๋๊ธฐ ๋๋ฌธ์ ๋์์ ์ฃผ์ํ  ๊ฒ!
 
 */
