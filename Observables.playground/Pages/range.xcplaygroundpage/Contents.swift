import RxSwift

/*
 ๐ range๋ for๋ฌธ์ฒ๋ผ Observable์์๋ ์์๋ฅผ ๋จ์ํ ์ฐ์์ ์ผ๋ก ๋ฐ๋ณต ๋ฐฉ์ถ์ํฌ ์ ์๋๋ก ๋์์ฃผ๋ ์ฐ์ฐ์์ด๋ค.
 ๐ซฅ range๋ Int ํ์์ผ๋ก ์ ํ์ด ์ด๋ฏธ ๊ฑธ๋ ค์๊ธฐ ๋๋ฌธ์ ๋ฐ๋ก ํ์ ์ ํ์ ๊ฑธ์ด์ค ํ์๋ ์๋ค.
 ๐ซถ๐ผ start์ count๋ ๋ง ๊ทธ๋๋ก ๋ช ๋ถํฐ ๋ช ๋ฒ ์นด์ดํธํ  ๊ฒ์ธ์ง๋ฅผ ์ ํด์ฃผ๋ ํ๋ผ๋ฉํฐ์ด๋ค. (start..<count)
 */
let rangeObservable = Observable.range(start: 0, count: 10)

rangeObservable.subscribe(onNext: { element in
    print(element)
})

/*
 ๐ป from์ ์ด์ฉํด์ range์ ๊ฐ์ด ํํํ  ์๋ ์๋ค.
 ๐ ๊ฒฐ๊ตญ from(0..<10)๊ณผ range(start: 0, count: 10) ์ ๊ทธ๋ฅ ์คํ์ผ ์ฐจ์ด ์ ๋๋ก ์๊ฐํด๋ ๋์ง๋ง ์ด๋ฐ ์ํฉ์ด๋ผ๋ฉด ํํ์ ๋ชํ์ฑ์ ์ํด range๋ฅผ ์ฌ์ฉํ๋ ๊ฒ์ด ๋ซ๋ค.
 */
let fromObservable = Observable.from(0..<10)

fromObservable.subscribe(onNext: { element in
    print(element)
})

/*
 [๊ฒฐ๋ก ]
 ๐ฏ ๋จ์ ๋ฐ๋ณต ์์๋ฅผ ๋ฐฉ์ถํ๋ Observable์ ๋ง๋ค๊ณ  ์ถ๋ค๋ฉด range๋ฅผ ์ฌ์ฉํ์
 ๐ฏ range๋ from์ผ๋ก๋ ๋์ผํ๊ฒ ํํํ  ์ ์๋ค! ์คํ์ผ ์ฐจ์ด๊ฐ ์์ ๋ฟ!
 */
