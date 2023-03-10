import RxSwift

/*
 
 ๐ฅฉ ignoringElements๋ ์ด๋ฒคํธ์์ ๋ฐฉ์ถ๋๋ ์์๋ค์ ๋ชจ๋ ๋ฌด์ํ ๋ ์ฌ์ฉํ๋ ์ฐ์ฐ์์ด๋ค.
 ๐ค ์ฌ์ฉ๋ฒ : ๊ตฌ๋ํ๊ธฐ ์ ์ .ignoreElements()๋ฅผ ํธ์ถํด์ค๋ค.
    -> observable.ignoreElements().subscribe()
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<String> {
    return Observable.create { observer in
        observer.onNext("๐ท")
        observer.onNext("๐น")
        observer.onNext("๐บ")
        observer.onNext("๐ธ")
        observer.onCompleted()
        
        return Disposables.create()
    }
}

// ์คํ ๊ฒฐ๊ณผ : Completed!
observable().ignoreElements().subscribe(onNext: { element in
    print(element)
}, onCompleted: {
    print("Completed!")
}).disposed(by: disposeBag)

/*
 ๐ฉ ์ ์ฝ๋์ ์คํ ๊ฒฐ๊ณผ์์ ์ ์ ์๋ฏ ๋ชจ๋  onNext์ด๋ฒคํธ๋ ๋ฌด์๋๊ณ  onCompleted๋ง ํธ์ถ๋๋ ๊ฒ์ ํ์ธํ  ์ ์๋ค.
 ๐ง ๋จ, onError ์ด๋ฒคํธ๋ ๋ฌด์ํ์ง ์์ผ๋ ์ ์ํ์!
 
 [๊ฒฐ๋ก ]
 ๐ฏ ์๋์ ์ผ๋ก Observable์์ ๋ฐฉ์ถ๋๋ element๋ค์ ๋ฌด์ํ๊ณ  ์ถ๋ค๋ฉด ignoringElements๋ฅผ ์ฌ์ฉํ์!
 */
