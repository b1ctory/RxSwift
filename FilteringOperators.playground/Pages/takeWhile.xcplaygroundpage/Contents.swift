import RxSwift

/*
 
 ๐ป takeWhile์ ~ ํ  ๋๊น์ง take ํ๋ผ๋ ์๋ฏธ๋ฅผ ๊ฐ์ง ์ฐ์ฐ์์ด๋ค.
 ๐ซถ๐ผ take(while:) ๋ skip(while:)๊ณผ ๋ง์ฐฌ๊ฐ์ง๋ก ์กฐ๊ฑด์ ์์ฑํด์ฃผ์ด์ผ ํ๋ค.
 ๐ถ๐ป ์ฌ๊ธฐ์ true๊ฐ ๋ฆฌํด๋๋ฉด takeํ๊ณ , false๊ฐ ๋ฆฌํด๋๋ฉด ๊ทธ ์์ ๋ถํฐ๋ ๋์ด์ ๋ฐฉ์ถ๋๋ element๋ ๋๊ฒจ์ฃผ์ง ์๋ ๊ฒ์ด๋ค.
 
 */

let disposeBag = DisposeBag()

func sushiRail() -> Observable<String> {
    return Observable.create { observer in
        observer.onNext("์์ฐ์ด๋ฐฅ")
        observer.onNext("๊ณ๋์ด๋ฐฅ")
        observer.onNext("์ฐ์ด์ด๋ฐฅ")
        observer.onNext("๐ชฐ")
        observer.onNext("๊ด์ด์ด๋ฐฅ")
        observer.onNext("์ฅ์ด์ด๋ฐฅ")
        
        return Disposables.create()
    }
}


/*
 [์คํ ๊ฒฐ๊ณผ]
 ์์ฐ์ด๋ฐฅ ๋ ๋ 
 ๊ณ๋์ด๋ฐฅ ๋ ๋ 
 ์ฐ์ด์ด๋ฐฅ ๋ ๋ 
 */
sushiRail().take(while: { sushi in
    return sushi != "๐ชฐ"
}).subscribe(onNext: { sushi in
    print("\(sushi) ๋ ๋ ")
}).disposed(by: disposeBag)

/// ์ถ์ฝ ํํ์
sushiRail().take(while: {
    $0 != "๐ชฐ"
}).subscribe(onNext: { sushi in
    print("\(sushi) ๋ ๋ ")
}).disposed(by: disposeBag)

/*
 [๊ฒฐ๋ก ]
 ๐ฏ ๋จ์ํ ๋ช ๊ฐ ๊น์ง์ ์์๋ง ๋ฐ๋ ์ฐ์ฐ์๊ฐ take๋ผ๋ฉด, ์ํ๋ ์กฐ๊ฑด์ ๋ง๋ ์์๋ค ๊น์ง๋ง ๋ฐ์ ์ ์๋๋ก ๋์์ฃผ๋ ์ฐ์ฐ์๋ takeWhile ์ด๋ค.
 ๐ฏ takeWhile์ ํน์ง์ ์กฐ๊ฑด์์์ true๊ฐ ๋ฆฌํด๋๋ ๋์์ ๊ณ์ํด์ ์์๋ฅผ ๋ฐ๋ค๊ฐ false๊ฐ ๋ฆฌํด๋๋ ์ฆ์ ๊ทธ ํ์ ๋ชจ๋  ์์๋ค์ ๊ตฌ๋์์๊ฒ ๋๊ฒจ์ฃผ์ง ์๋๋ค๋ ๊ฒ์ด๋ค.
 ๐ฏ skipWhile์ด๋ takeWhile ๊ทธ๋ฆฌ๊ณ  filter ๋ฑ ๊ฐ ์ฐ์ฐ ํด๋ก์ ์์ ๋ฆฌํดํด์ฃผ๋ Boolean ๊ฐ์ ๋ฐ๋ผ์ ๊ฐ์ ์ ๋ฌํด์ฃผ๊ฑฐ๋ ์ ๋ฌํด์ฃผ์ง ์๋ ๊ฒฝ์ฐ๊ฐ ํท๊ฐ๋ฆด ์ ์์ผ๋ ์ฃผ์ํ์!
 */
