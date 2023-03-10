import RxSwift

/*
 ๐ฆ Traits๋ Observable์ ํ์ํ์ด๋ค. ๊ทธ ๋ง์ธ ์ฆ์จ, Traits๋ ์์ฐํ Observable์ด๋ผ๋ ๋ป์ด๋ค.
 ๐ฆ ๋ํ ๊ทธ ๋ง์ ๊ณง Traits๋ฅผ ์์ฑํ๋ ๊ฒ์ ์ผ๋ฐ Observable์ ์์ฑํ๋ ๋ฐฉ์๊ณผ ํฌ๊ฒ ๋ค๋ฅด์ง ์๋ค๊ณ  ํด์ํ  ์ ์๋ค.
 ๐ ๊ทธ๋์ Single์ ๋น๋กฏํ ๋ค๋ฅธ Traits๋ Observable.create() ์ฒ๋ผ ๋ง๋ค ์ ์๋ค => Single.create()
 */

/// Observable create
func rawObservable() -> Observable<Any> {
    return Observable.create { observer in
//        observer.onNext()
//        observer.onError()
//        observer.onCompleted()
        
        return Disposables.create()
    }
}

/// Single (Trait)
func singleObservable() -> Single<Any> {
    return Single.create { single in
//        single(.success())
//        single(.failure())
        return Disposables.create()
    }
}

/*
 ๐ท Single์ create๋ก ์์ฑํ  ๋์ ๋ฐฉ์๊ณผ Observable์ ๋ฐฉ์์ ๋น๊ตํด๋ณด๋ฉด ๋งค์ฐ ํก์ฌํ๋ค.
 ๐ป ๋ค๋ง, Single์์ฑ ์ฝ๋์์ ๋ณด์ด๋ ๊ฒ๊ณผ ๊ฐ์ด onNext, onError, onComplete ๋์  .success(), .failure() ์ด๋ ๊ฒ ๋๊ฐ์ง ์ด๋ฒคํธ๋ฐ์ ์๋ ๊ฒ์ ํ์ธํ  ์ ์๋ค.
 
 [์ด๋ฒคํธ ํ์]
 ๐ success
    ๐ .success() ๋ ์ผ๋ฐ Observable์ onNext + onCompleted ์ ๊ฐ์ ์ญํ ์ด๋ค.
    ๐ onNext ์ด๋ฒคํธ๋ฅผ ๋ฐฉ์ถํจ๊ณผ ๋์์ onCompleted ์ํค๋ ๊ฒ
 ๐ failure
    ๐ .failure()๋ onError์ ๊ฐ์ ์ญํ ์ด๋ค.
 ๐ ๊ทธ๋ฐ๋ฐ ์ observer.success()๊ฐ ์๋๋ผ observer(.success()) ์ผ๊น?
    ๐ ๊ทธ ์ด์ ๋ ์ ์ด์ Traits๋ผ๋ ๊ฒ์ด Observable์ wrapper ๊ตฌ์กฐ์ฒด์ด๊ธฐ ๋๋ฌธ์ด๋ค.
    ๐ซ ์ฆ, Observable์์ ๋ฐฉ์ถ๋๋ ์ด๋ฒคํธ๋ฅผ ๊ธฐํธ์ ๋ง๊ฒ ๊ฐ์ผ ์กด์ฌ๋ผ๊ณ  ์๊ฐํ๋ฉด ๋๋ค.
 ๐ฟ ์ด๋ฐ Single์ ํน์ฑ์ ์ด์ฉํด์ ๋จ ํ๊ฐ์ง์ ๊ฐ ํน์ ์๋ฌ ๋๊ฐ์ง ํํ๋ฅผ ๋ณด์ฅ๋ฐ์ ์ ์์ ๋ Single์ ์ฌ์ฉํ๋ฉด ๋๋ค.
 ๐ฎ ๋ํ์ ์ธ Single์ ์ฌ์ฉ ์์๋ก API Request๋ฅผ ํตํด ํ๋์ ๋ณด์ฅ๋ ์์๋ ์๋ฌ๋ฅผ ๋ฐ์ ๋ ์ ์ฉํ๋ค.
 
 [์ฃผ์์ฌํญ]
 ๐ Observable๊ณผ Single์ ์ด๋ฒคํธ ํ์์ด ์๋ก ๋ค๋ฅด๋ค ๋ณด๋ Observable ์คํธ๋ฆผ์์ Single ์คํธ๋ฆผ์ผ๋ก ์ด๋ํ๋ค๋์ง ํ๋ ํผ์ฉ์ ๋ฌธ์ ๊ฐ ์๊ธฐ๊ฒ ๋๋ค.
 ๐ ์๋ฅผ ๋ค์ด asSingle() ์ฐ์ฐ์๋ฅผ ์ฌ์ฉํด์ Observable -> Single ์ด๋ ๊ฒ ์ํ์ค๋ฅผ ๋ณํํ๋ค๊ณ  ํ์ ๋ .success() ๋ onNext + onCompleted ์ ๊ฐ์ ์กด์ฌ์ด๋ ๋ง์ฝ Observable์์ onCompleted๊ฐ ๋ฐ์ํ๊ธฐ ์  ์์ ์ onNext๊ฐ ์๋ค๋ฉด Single๋ก ๋ณํ ์ ์๋ฌ๊ฐ ๋ฐ์ํ๊ฒ ๋๋ ๊ฒ์ด๋ค.
 ๐ ๊ทธ๋ ๊ธฐ ๋๋ฌธ์ Single์ ์ฌ์ฉํ๋ ค๋ฉด ์ผ๊ด์ฑ์๊ฒ Single๋ก ์ํ์ค๋ฅผ ์ ์งํ๋ ๊ฒ์ด ์ข๋ค.
 
 [๊ฒฐ๋ก ]
 ๐ฏ ์ค์ง ํ๋์ ๊ฐ ํน์ ์๋ฌ ์ด๋ ๊ฒ ๋๊ฐ์ง ํํ๋ง ๋ณด์ฅํด์ฃผ๋ Observable์ ์์ฑํ๊ณ  ์ถ๋ค๋ฉด Single์ ์ฌ์ฉํ์!
 */
