import RxSwift

/*
 
 ๐ฆ switchLatest๋ ์ฐ์ฐ์ ์ด๋ฆ์์๋ ์ ์ ์๋ฏ์ด ๊ฐ Observable๋ค์ ๊ตฌ๋ํ ์ํ์์ ์ด Observable ์  Observable์ switch ์ํค๋ฉด์ ์์๋ฅผ ์ ๋ฌ๋ฐ์ ์ ์๋๋ก ๋์์ฃผ๋ ์ฐ์ฐ์์ด๋ค.
 
 */

let disposeBag = DisposeBag()

let first = PublishSubject<String>()
let second = PublishSubject<String>()
let source = PublishSubject<Observable<String>>()

source.switchLatest()
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

source.onNext(first)
first.onNext("1 I'm from first")
source.onNext(second)
second.onNext("100 I'm from second")

/*
 
 [๊ฒฐ๋ก ]
 ๐ฏ ๋ค์์ Observable์ ๊ต์ฒดํ๋ฉด์ ์์๋ฅผ ์ ๋ฌ๋ฐ๊ณ  ์ถ์ ๋ switchLatest๋ฅผ ์ฌ์ฉํ์
 
 */
