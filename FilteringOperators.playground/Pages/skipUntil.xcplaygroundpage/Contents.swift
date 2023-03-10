import RxSwift

/*
 
 ๐ก skipUntil์ด๋ ๋ง ๊ทธ๋๋ก "~ํ  ๋๊น์ง ์คํตํด๋ผ!"๋ ์๋ฏธ๋ฅผ ์ง๋ ์ฐ์ฐ์์ด๋ค.
 ๐คฌ skipUntil์ ํ๋ผ๋ฉํฐ๋ก ๋ค๋ฅธ Observable์ ๋ฐ๊ณ  ์๋๋ฐ, ์ด ํ๋ผ๋ฉํฐ๋ก ๋ฐ์ Observable์์ ์ด๋ฒคํธ๊ฐ ๋ฐฉ์ถ๋๋ฉด ๊ทธ์ ์์ผ ์์๋ฅผ ์ ๋ฌ๋ฐ๋ ํ์์ธ ๊ฒ์ด๋ค.
 
 */

let disposeBag = DisposeBag()

let observable = PublishSubject<Int>()
let trigger = PublishSubject<Any>()

observable.skip(until: trigger)
    .subscribe(onNext: { element in
        print("\(element)๊ฐ ๋ฐฉ์ถ๋จ")
    }).disposed(by: disposeBag)

observable.onNext(1)
observable.onNext(2)
trigger.onNext("๋นต์ผ๋นต์ผ๐ซ")
observable.onNext(3)
observable.onNext(4)
observable.onNext(5)

/*
 [์ถ๋ ฅ ๊ฒฐ๊ณผ]
 3๊ฐ ๋ฐฉ์ถ๋จ
 4๊ฐ ๋ฐฉ์ถ๋จ
 5๊ฐ ๋ฐฉ์ถ๋จ

 ๐งธ trigger์์ ์ด๋ค ์์๊ฐ ๋ฐฉ์ถ๋์๋์ง๋ ๋ณ๋ก ์ค์ํ์ง ์๋ค.
 ๐ ๊ทธ์  ์์๊ฐ ๋ฐฉ์ถ๋์๋ค๋ ์ฌ์ค์ด ๋ ์ค์ํ๋ค.
 
 [๊ฒฐ๋ก ]
 ๐ฏ ๋ค๋ฅธ Trigger ์ญํ ์ ํ๋ Observable์์ ์์๊ฐ ๋ฐฉ์ถ๋ ์ดํ์ ํ์ฌ Observable์์ ๋ฐฉ์ถ๋๋ ์์๋ค์ ๊ตฌ๋์์๊ฒ ์ ๋ฌํ๊ณ  ์ถ๋ค๋ฉด skipUntil์ ์ฌ์ฉํ์
 ๐ฏ Trigger์ ์ญํ ์ ํ๋ Observable์์ ๋ฐฉ์ถ๋๋ ์์์ ์ ์ฒด๋ ๊ทธ๋ ๊ฒ ์ค์ํ์ง ์๊ณ , Trigger์ Observable์์ ์์๊ฐ ๋ฐฉ์ถ๋์๋ค๋ ์ฌ์ค์ด skipUntil ์์๋ ๋ ์ค์ํ๋ค.
 */
