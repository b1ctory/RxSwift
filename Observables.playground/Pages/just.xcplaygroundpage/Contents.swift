import RxSwift

/*
 ๐ถ Observable์ ์์ฑํ๋ ๋ฐ์๋ just, of, from ์ฐ์ฐ์๊ฐ ์๋ค.
 ๐ถ ์กฐ๊ธ ๋ ์ฌ์ธํ๊ฒ ์ปจํธ๋กค์ด ํ์ํ๋ค๋ฉด create๋ฅผ ์ด์ฉํด์ ์์ฑํ  ์ ์๋ค. (์ถํ ์ค๋ช)
 ๐ถ just๋ ๊ฐ๋จํ๊ฒ Observable์ ์์ฑํ๋ ๋ฐฉ์ ์ค ํ๋์ด๋ค.
 
 ๐งถ just๋ ์ค์ง ํ๋์ ์์๋ฅผ ๋ฐฉ์ถ์ํค๊ณ  ๋๋๋ ObservableType ํ๋กํ ์ฝ์ TypeMethod ์ด๋ค.
 ๐ ์ฝ๊ฒ ๋งํด, just๋ ๋ง๊ทธ๋๋ก ํ๋์ Element (์์)๋ฅผ ๋ฐฉ์ถ์ํค๋ Observable์ด๋ค.
 */

// ๐ just๋ ๋จ ํ๋์ ์์๋ฅผ ๋ฐฉ์ถ์ํค๊ธฐ ๋๋ฌธ์ .just() ํธ์ถ๊ณผ ๋์์ ๋ฐฉ์ถ ์ํฌ ๊ฐ์ ๋ฃ์ด์ค๋ค.
let justStringObservable = Observable.just("This is String Observable")
let justIntObservable = Observable.just(1004)

/// ํ์ํ ์ด๋ฒคํธ๋ง ์ฒ๋ฆฌ!
justStringObservable
    .subscribe(onNext: { element in
        print(element)
    }, onCompleted: {
        print("Completed!")
    })

justIntObservable
    .subscribe(onNext: { element in
        print(element)
    }, onCompleted: {
        print("Completed!")
    })

// ๐just์ ๋ฃ์ ์ ์๋ ํ์์ ์ ํํ  ์๋ ์๋ค. ํ์์ ํ์ ์ค ์ํ์์ ๋ค๋ฅธ ํ์์ ๋ฃ์ด์ฃผ๋ฉด ์๋ฌ ๋ฐ์!
let stringObservable: Observable<String> = Observable.just("String Observable : ํ์ ์ ํ")

/*
 [๊ฒฐ๋ก ]
 ๐ฏ ๊ฐ๋จํ๊ฒ ํ๋์ ์์๋ง ๋ฐฉ์ถํ๋ Observable๋ง ์์ฑํ๊ณ  ์ถ๋ค๋ฉด just ์ฌ์ฉ!
 */
