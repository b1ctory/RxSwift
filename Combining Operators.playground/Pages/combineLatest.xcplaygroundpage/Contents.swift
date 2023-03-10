import RxSwift

/*
 
 ๐ฆ ๊ฐ Observable์์ ๋ฐฉ์ถ๋๋ ์์๋ค ์ค ๊ฐ์ฅ ์ต๊ทผ ์์๋ค๋ผ๋ฆฌ ๊ฒฐํฉํด์ ๊ตฌ๋์์๊ฒ ์ ๋ฌํด์ฃผ๋ ์ฐ์ฐ์
 
 */

let disposeBag = DisposeBag()

// ๐ป Observable ์ ์ฌ์ฉํ์ง ์๊ณ  PublishSubject๋ฅผ ์ฌ์ฉํ๋ ์ด์ ๋ ์ํ๋ ์์ ์ ์์ ๋ฐฉ์ถ์ ์ํจ์
let first = PublishSubject<Int>()
let second = PublishSubject<Int>()

Observable.combineLatest(first, second)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

first.onNext(1)
second.onNext(3)
second.onNext(4)
first.onNext(2)
second.onNext(5)
first.onNext(3)

print("---------------------")

// ํํ ํ์ ๋ง๊ณ  ๊ฐ๊ฐ ๋ฐ๋ก ๋ฐ์ ์๋ ์๋ค!
Observable.combineLatest(first, second)
    .subscribe(onNext: { left, right in
        print("\(left) and \(right)")
    }, onCompleted: {
        print("onCompleted")
    }).disposed(by: disposeBag)

first.onNext(1)
second.onNext(3)
second.onNext(4)
first.onNext(2)
second.onNext(5)
first.onNext(3)

/*
 [๊ฒฐ๋ก ]
 ๐ฏ ํ์ฌ ๋ฐฉ์ถ๋ ์์์ ๋ค๋ฅธ Observable์์ ๋ฐฉ์ถ๋ ์ต์ข๊ฐ์ ๋น๊ตํ๊ณ  ์ถ์ ์ผ์ด ์๋ค๋ฉด combineLatest๋ฅผ ์ฌ์ฉํ๋๋ก ํ์
 */
