import RxSwift

/*
 
 ๐ skip์ onNext๋ก ์ ๋ฌ๋ฐ์ element๋ฅผ ๊ฑด๋๋ฐ์ด์ฃผ๋ ์ฐ์ฐ์์ด๋ค.
 ๐ข skip() ์ฐ์ฐ์๋ int ๊ฐ์ ํ๋ผ๋ฉํฐ๋ก ๋ฐ๋๋ฐ, ์ด๋ ๋ช ๋ฒ ๊ฑด๋๋ธ์ง๋ฅผ ๋ฌป๋ ๊ฒ์ด๋ค.
 ๐ ์๋ฅผ ๋ค์ด skip(1) ์ด๋ผ๋ฉด ํ ๋ฒ ์์๋ฅผ ๊ตฌ๋์์๊ฒ ์ ๋ฌํด์ฃผ์ง ์๋ค๊ฐ ๊ทธ ๋ค๋ก๋ ์ ๋ฌํ๋ค.
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<Int> {
    return Observable.create { observer in
        observer.onNext(1)
        observer.onNext(2)
        observer.onNext(3)
        observer.onCompleted()
        
        return Disposables.create()
    }
}

// ์คํ ๊ฒฐ๊ณผ : 3 ๋ฐฉ์ถ!
observable().skip(2)
    .subscribe(onNext: { element in
        print("\(element) ๋ฐฉ์ถ!")
    }).disposed(by: disposeBag)

// ๐ฆฎ ์ฌ๋ฌ๊ฐ์ ์ฐ์ฐ์๋ค์ subscribe ํ๊ธฐ ์ ์ ์์ด์ ์ฌ์ฉํ  ์๋ ์๋ค.
observable().skip(2)
    .filter { $0 > 2 }
    .subscribe(onNext: { element in
        print("skip๊ณผ filter์ ๊ฑฐ์น \(element) ๋ฐฉ์ถ!")
    }, onCompleted: {
        print("Completed !")
    }).disposed(by: disposeBag)

/*
 [๊ฒฐ๋ก ]
 ๐ฏ 0 ~ n๊ฐ๊น์ง ์ฒ์ ๋ฐฉ์ถ๋๋ ์์๋ค์ ๊ตฌ๋์์๊ฒ ์ ๋ฌ์ํค๊ณ ์ถ์ง ์๋ค๋ฉด skip ์ฐ์ฐ์๋ฅผ ์ด์ฉํ์!
 */
