import RxSwift

/*
 ๐ฆญ onNext, onError, onCompletd, onDisposed ๋ฑ์ ์ด๋ฒคํธ๋ฅผ ์ํ๋ ์์ ์์ ๋ฐฉ์ถ์ํฌ ์ ์๊ฒ ๋์์ฃผ๋ ๊ฒ์ด create ์ฐ์ฐ์์ด๋ค.
 ๐ฆ create ์ฐ์ฐ์๋ฅผ ์ฌ์ฉํด ์์ ์์ฌ๋ก ์ํ๋ ์์ ์ ์ํ๋ ์ด๋ฒคํธ๋ฅผ ๋ฐฉ์ถ์ํค๋ Observable์ ์์ฑํ๊ณ  subscribe ํด์ ์ฌ์ฉํ  ์ ์๋ค.
 */

// ๐ ๋จผ์  Observable<T>.create() ๋ก ํ์ ๋ง๋ค์ด์ค๋ค.
let customObservable = Observable<String>.create { observer in
    return Disposables.create()
}

/*
 [์ ์ฝ๋์ ๋ํ ์ค๋ช]
 ๐ Observable<String>์ ์ ๋ค๋ฆญ ํ์์ onNext๋ก ๋ฐฉ์ถ์ํฌ ์์์ ํ์!
 ๐ฅจ ๊ทธ๋ฆฌ๊ณ  create ํด๋ก์ ์ ํ๋ผ๋ฉํฐ์ธ observer๋ฅผ ์ด์ฉํด์ onNext, onError, onCompleted ์ด๋ฒคํธ๋ฅผ ๋ฐฉ์ถํ  ์ ์๋ค.
 ๐ฅ Observable์ ๊ตฌ๋ํ๊ฒ ๋๋ฉด disposable์ด๋ผ๋ ๊ฒ์ด ๋ฆฌํด๋์ด ์ฒ๋ฆฌ๋ฅผ ํด์ค์ผํ๋๋ฐ, ๊ทธ disposable์ ์ ์ฒด๊ฐ Disposables.create() ์ด๋ค. (ํ์ ๊ตฌํ ์์)
 ๐ฆ ํ์ ๋ง๋  ํ, ๊ฐ ์ด๋ฒคํธ๋ฅผ ์ด๋ป๊ฒ ํธ์ถํ๋๊ฐ? -> ์๋์ ์ฝ๋๋ฅผ ํ์ธ!
 */

let disposeBag = DisposeBag()

let secondCustomObservable = Observable<String>.create { observer in
    observer.onNext("๐๐๐ฅค")
    observer.onCompleted()
    
    return Disposables.create()
}

secondCustomObservable.subscribe(onNext: { element in
    print(element)
}, onCompleted: {
    print("OnCompleted")
}).disposed(by: disposeBag)

/*
 ๐น ๊ทธ๋ฌ๋ create๋ ๋ณ์๋ก ์ ์ธํ๋ ๋ฐฉ์๋ณด๋ค๋ ํจ์๋ก์ ์ ์ธํ๋ ๋ฐฉ์์ด ๋ ์์ฃผ ์ฌ์ฉ๋๋ค. ํจ์๋ก ๋ฐ๊พธ๋ฉด ๋ค์๊ณผ ๊ฐ๋ค.
 */
func secondCustomObservableFunc() -> Observable<String> {
    return Observable<String>.create { observer in
        observer.onNext("๐๐๐ฅค")
        observer.onCompleted()
        
        return Disposables.create()
    }
}

secondCustomObservableFunc().subscribe(onNext: { element in
    print(element)
}, onCompleted: {
    print("OnCompleted")
}).disposed(by: disposeBag)

/*
 [๊ฒฐ๋ก ]
 ๐ฏ Custom Observable ์คํธ๋ฆผ์ ๋ง๋ค๊ณ  ์ถ์ ๋๋ create ๋ฅผ ์ด์ฉํด์ ์ง์  ๋ง๋๋ ๊ฒ์ด ์ข๋ค.
 */
