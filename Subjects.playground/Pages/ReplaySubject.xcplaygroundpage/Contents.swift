import RxSwift

/*
 
 ๐ ReplaySubject๋ ์ด์ ์ ๋ฐฉ์ถ๋๋ ์์๋ค์ ๋ฒํผ์ ์ ์ฅํด ๋์๋ค๊ฐ ์๋ก์ด ๊ตฌ๋์๊ฐ ๊ตฌ๋๋์์ ๋ ๊ฐ์ด ๋๊ฒจ์ฃผ๋ ๋ฐฉ์์ Subject
 ๐ behaviorSubject์๋ ๋ค๋ฅด๊ฒ ์ ์ผ ์ฒ์ ๊ตฌ๋์๋ฅผ ์ํ ์ด๊ธฐ๊ฐ ์ค์ ์ด ํ์์์ผ๋ฉฐ, ๊ฐ์ฅ ์ต๊ทผ์ ๋ฐฉ์ถ๋์๋ ์์๋ค์ ์ต๋ ๊ฐ์๋ฅผ ์ง์ ํด์ค ์ ์๋ค๋ ์ ์์ ๋ค๋ฅด๋ค.
 ๐ฉฒ ์ผ๋จ ReplaySubject๋ ๋ค๋ฅธ Subject์ ๋ฌ๋ฆฌ .create()๋ก ์ ์ธํ๋ค.
 ๐ก ๊ฐ์ฅ ์ต๊ทผ ๋ฐฉ์ถ๋ ์์๋ค์ ์ต๋ ๊ฐ์๋ bufferSize๋ผ๋ ํ๋ผ๋ฉํฐ๋ก ๋ฐ๊ณ  ์๋ค.
 ๐ ์๋ฅผ ๋ค์ด bufferSize๋ฅผ 2๋ผ๊ณ  ํ๋ฉด ๊ตฌ๋ํ๊ธฐ ์ ์ ๋ฐฉ์ถ๋์๋ ์์๋ฅผ 2๊ฐ๊น์ง ๊ฐ์ ธ์์ ๊ทธ ์์๋ค์ ์์์ผ๋ก ๊ทธ ๋ค์ ๋ฐฉ์ถ์์๋ค์ ๋ฐ๋ ๊ฒ์ด๋ค.
 
 */

let disposeBag = DisposeBag()
var replaySubject = ReplaySubject<Int>.create(bufferSize: 2)

// subscriber 1
replaySubject.subscribe(onNext: { element in
    print("subscriber1 \(element)")
}).disposed(by: disposeBag)

replaySubject.onNext(1)
replaySubject.onNext(2)


// subscriber 2
replaySubject.subscribe(onNext: { element in
    print("subscriber2 \(element)")
}).disposed(by: disposeBag)

replaySubject.onNext(3)
replaySubject.onNext(4)


// subscriber 3
replaySubject.subscribe(onNext: { element in
    print("subscriber3 \(element)")
}).disposed(by: disposeBag)

replaySubject.onNext(5)

/*
 
 [์ฃผ์์ฌํญ]
 โ๏ธ buffer์ ์ด์  ๋ฐฉ์ถ๋ ์์๋ค์ ์ ์ฅํ๋ ํ์๋ ์์ฐํ ๋ฉ๋ชจ๋ฆฌ๋ฅผ ์ฌ์ฉํ๋ ํ์์ด๊ธฐ ๋๋ฌธ์ ์ด๋ฏธ์ง ํน์ ์์ ๋ฐ์ดํฐ๋ค์ ReplaySubject๋ก ๋ค๋ฃฐ ๋ ๋๋ฌด ๋จ๋ฐํ์ง ์๋ ๊ฒ์ด ์ข๋ค.
 
 [๊ฒฐ๋ก ]
 ๐ฏ Subject๋ฅผ ๊ตฌ๋ํ  ๋ ๊ฐ์ฅ ์ต๊ทผ ๋ฐฉ์ถ๋์๋ 1๊ฐ ์ด์์ ์์๋ฅผ ์ด๋ํ๊ณ  ์ถ์ ๋๋ ReplaySubject๋ฅผ ์ด์ฉํ์!
 
 */
