import RxSwift

/*

 ๐ฟ timeout์ ๋ด๊ฐ ์ค์ ํ ์๊ฐ๋์ ์๋ฌด๋ฐ ์์๊ฐ ๋ฐฉ์ถ๋์ง ์์ผ๋ฉด ๊ทธ๋๋ก Observable ์ํ์ค๋ฅผ ์ข๋ฃํ๋๋ก ๋ง๋๋ ์ฐ์ฐ์์ด๋ค.
 ๐ฆฆ ๋ก๋ฉ ์๊ฐ ์ด๊ณผ ๋ฑ์ ์ฒ๋ฆฌ๋ฅผ ํด์ค ์ ์๋น!
 ๐ฆซ timeout์ ์ธ์๊ฐ์ผ๋ก ์ ํด์ค ์๊ฐ๋์ ์๋ฌด๋ฐ ์์๊ฐ ์ ๋ฌ๋์ง ์์ผ๋ฉด error๋ฅผ ๋ฐฉ์ถ์ํค๊ณ  Observable์ disposed๋๋ค.
 ๐ dueTime : ์์๊ฐ ๋ฐฉ์ถ๋๊ธฐ๊น์ง ์ผ๋ง๋ ๊ธฐ๋ค๋ฆด ๊ฒ์ธ์ง๋ฅผ ์ค์ 
 ๐ฆ schedular : ์ด๋ค ์ค๋ ๋์์ ์ฝ๋๋ฅผ ์คํ์ํฌ ๊ฒ์ธ์ง ์ ํด์ฃผ๋ ํ๋ผ๋ฉํฐ
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<Int> {
    return Observable.create { observer in
        observer.onNext(1)
        
        return Disposables.create()
    }
}

observable()
    .delay(.seconds(10), scheduler: MainScheduler.instance)
    .timeout(.seconds(5), scheduler: MainScheduler.instance)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

// ์๋์๊ฐ์ด ๊ตฌํํ๋ฉด timeoutError๊ฐ ๋ฐฉ์ถ๋์ด๋ ์๋ฌ๋ฅผ ๋ฐฉ์ถ์ํค์ง ์๊ณ  ๊ตฌ๋์์๊ฒ ๊ธฐ๋ณธ๊ฐ์ ์ ๋ฌํ๋ค.
observable()
    .debug()
    .timeout(.seconds(5), scheduler: MainScheduler.instance)
    .catchAndReturn(-1)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 
 ๐ API๋ฅผ ์์ฒญํ๊ฑฐ๋ ํ  ๋ ์๊ฐ์ด ๋๋ฌด ์ค๋๊ฑธ๋ฆฌ๋ฉด ๊ธฐ๋ณธ๊ฐ์ ์ ๋ฌํด์ฃผ๊ฑฐ๋ ํ  ๋ ์ ์ฉํ๊ฒ ์ฌ์ฉํ  ์ ์๋ค.
 
 [๊ฒฐ๋ก ]
 ๐ฏ Observable์ ๊ตฌ๋ํ๊ณ ์ ์ผ์  ์๊ฐ๋์ ์๋ต์ด ์๋ ๊ฒฝ์ฐ๋ฅผ ์ฒ๋ฆฌํ๊ณ  ์ถ๋ค๋ฉด timeout ์ฐ์ฐ์๋ฅผ ์ฌ์ฉ
 ๐ฏ timeout์ผ๋ก ์ธํ ์๋ฌ ๋์ ์ ๊ธฐ๋ณธ๊ฐ์ ์ ๋ฌํ๊ณ  ์ถ๋ค๋ฉด .catchErrorJustReturn()
 
 */
