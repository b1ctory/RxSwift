import RxSwift
import RxCocoa

/*
 
 ๐ป ๋ค์์ Observable์์ ๋ฐฉ์ถ๋๋ ์์๋ค์ ๋ชจ๋ ๋ณํฉ์์ผ์ฃผ๋ ์ฐ์ฐ์ merge
 ๐ผ ๋ Observable์ merge ํ๋ฉด ์๋ก์ ์์๊ฐ ๋ฐฉ์ถ๋๋ ์์ ๋ ์ ์ง์์ผ์ฃผ๋ฉด์ ํ๋์ Observable๋ก ๋ณํฉ๋๋ ๋ชจ์ต์ ํ์ธํ  ์ ์๋ค.
 ๐ปโโ๏ธ merge ๊ฐ์ ๊ฒฝ์ฐ๋ ๋ค๋ฅธ ์ฐ์ฐ์๋ค๊ณผ ๊ฐ์ด .merge() ๋ก ํธ์ถํด์ ์ฌ์ฉํ  ์ ์๊ณ , static์ผ๋ก ์ ์๋์ด ์๊ธฐ ๋๋ฌธ์ Observabl.merge() ์ด๋ ๊ฒ ํธ์ถํด์ ์ฌ์ฉํ  ์๋ ์๋ค.
 
 */

let disposeBag = DisposeBag()

let first = Observable.of("1๐ฆ", "2๐ฆ", "3๐ฆ")
let second = Observable.of("4๐จ", "5๐จ", "6๐จ")

Observable
    .merge(first, second)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

print("-----------------------------")

Observable.of(first, second)
    .merge()
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)



print("-----------------------------")

let firstSubject = PublishSubject<Int>()
let secondSubject = PublishSubject<Int>()

Observable.merge(firstSubject, secondSubject)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

firstSubject.onNext(1)
secondSubject.onNext(2)
firstSubject.onNext(3)
secondSubject.onNext(4)
firstSubject.onNext(5)
secondSubject.onNext(6)

/*
 
 ๐ฏ maxConcurrent : ๋ช ๊ฐ์ Observable์ ๋ณํฉ์์ผ์ค ๊ฑด์ง ์ ํ
 
 */
let subjectBlue = PublishSubject<String>()
let subjectYellow = PublishSubject<String>()
let subjectRed = PublishSubject<String>()

Observable.of(subjectBlue, subjectYellow, subjectRed)
    .merge(maxConcurrent: 2)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

subjectBlue.onNext("1๐ฆ")
subjectRed.onNext("2๐ฅ")
subjectYellow.onNext("3๐จ")

subjectBlue.onNext("1๐ฆ")
subjectRed.onNext("2๐ฅ")
subjectYellow.onNext("3๐จ")

subjectBlue.onCompleted()
subjectRed.onNext("4๐ฅ")

/*
 
 ๐ฎ ๋ค์์ Observable์ ๋ชจ๋ ๋ณํฉ์ํค๋ ๊ฒ์ด๋ค ๋ณด๋ ๋ชจ๋  Observable๋ค์ด onCompleted๊ฐ ํธ์ถ์ด ๋์ด์ผ์ง๋ง ์ต์ข์ ์ผ๋ก ๋ณํฉ๋ Observable๋ onCompleted๊ฐ ํธ์ถ๋๋ค.
 ๐ท ๋ง์ฝ ์ด๋ฅผ ์ธ์งํ์ง ์๊ณ  onCompleted๋ฅผ ๋ฌด์ํ๋ฉด ๋ฉ๋ชจ๋ฆฌ ๋์ ๊ฐ๋ฅ์ฑ
 ๐ง ๊ผญ ๋ชจ๋  Observable๋ค์ด onCompleted๋์ด์ผ ํ๋๋ก ๋ณํฉ๋ Observable๋ onCompleted๋๋ค!
 
 [๊ฒฐ๋ก ]
 ๐ฏ ๋ค์์ Observable์ ๋ณํฉํ๊ณ  ์ถ๋ค๋ฉด merge ์ฐ์ฐ์๋ฅผ ์ด์ฉํด ๊ฐํธํ๊ฒ ๋ณํฉ
 ๐ฏ ๋ค์์ Observable๋ค์ ๋ณํฉํ๊ฒ ๋๋ฉด ํ๋์ Observable ์ํ์ค์์ ์์๋ค์ ๊ด๋ฆฌํ๊ฒ ๋๋ ๊ฒ์ด๋ ๋ชจ๋ ํ์์ ๋ง์ถฐ์ฃผ์
 
 */
