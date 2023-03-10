import RxSwift

/*
 
 ๐ฐ Subject : ๊ตฌ๋์๊ฐ ๊ตฌ๋ํ๋ ์์  ์ดํ์ ์ด๋ฒคํธ๋ค๋ง ์ ๋ฌ๋ฐ์ ์ ์๋๋ก ๋์์ค๋ค. ๊ทธ๋ฆฌ๊ณ  Subject๋ฅผ ์์ฑํ๊ธฐ ์ํด ๊ฐ์ฅ ๊ธฐ๋ณธ์ ์ผ๋ก ์ฌ์ฉ๋๋ ๊ฒ์ด PublishSubject ์ด๋ค.
 
 */

let disposeBag = DisposeBag()

var subject = PublishSubject<String>()
subject.onNext("hi")
subject.onCompleted()

/*
 
 ๐ฆ subject๋ Observer์ ์ญํ ๋ ํ์ง๋ง ๋์์ Observable์ ์ญํ ๋ ํ  ์ ์๊ธฐ ๋๋ฌธ์ ์ด๋ฒคํธ๋ฅผ ๋ฐฉ์ถํ  ์ ์๋ ๊ฒ์ด๋ค.
 
 */

subject.onNext("๐ถ")
subject.onNext("๐ฑ")
subject.onNext("๐ญ")
subject.onNext("๐ฆ")

subject.subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)

subject.onNext("๐ถ")
subject.onNext("๐ฑ")
subject.onNext("๐ญ")
subject.onNext("๐ฆ")

/*
 [์ถ๋ ฅ๊ฒฐ๊ณผ] -> ๊ตฌ๋ ์ดํ ํธ์ถํด์ค ์ด๋ฒคํธ๋ง!
 ๐ถ
 ๐ฑ
 ๐ญ
 ๐ฆ
 
 ๐  ์ด์๊ฐ์ด Subject ํน์ฑ์ ์ด์ฉํด์ ๊ตฌ๋ํ๋ ์์ ์๋ฐ๋ผ ์ด์  ์ด๋ฒคํธ๋ฅผ ๋ฐ์ ํ์๊ฐ ์๋ ๊ฒฝ์ฐ ์ ์ฉํ๋ค.
 
 [๊ฒฐ๋ก ]
 ๐ฏ ๊ตฌ๋ํ๋ ์์ ์ ์ํฅ์ ์ฃผ๋ Observable์ ์์ฑํ๊ณ  ์ถ๋ค๋ฉด ์ผ๋ฐ Observable์ด ์๋ PublishSubject๋ฅผ ์ฌ์ฉํ์!
 
 */
