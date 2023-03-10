import RxSwift

/*
 
 ๐ต Observable์ ์ด๊ธฐํํ๊ณ  ์ถ์ ๋, ์๋์ ๋ฐฉ์์ผ๋ก ์ด๊ธฐํํ๋ ค๊ณ  ํ๋ฉด ์๋ฌ๊ฐ ๋ฐ์ํ๋ค.
 ๐ฆญ let emptyObservable: Observable = Observable<Any>()
 โ error Message : 'Observable<Element>' initializer is inaccessible due to 'internal' protection level
 
 ๐ ์ด๋ด๋ ์ฌ์ฉํ๋ ๊ฒ์ด empty() ์ด๋ค. ์๋์ ๊ฐ์ด ์ฌ์ฉํด์ ๋น Observable์ ์ ์ธํ  ์ ์๋ค.
 */

let emptyObservable: Observable = Observable<Any>.empty()


/*
 โ empty()๋ Observable์ ์ด๊ธฐํ ์ํฌ ๋๋ ์ฌ์ฉ๋์ง๋ง,
 ๐บ ์ฆ์ completed ๋๋ Observable์ด๋ element๊ฐ 0๊ฐ์ธ Observable์ ์๋์ ์ผ๋ก ๋ฆฌํดํ๊ณ  ์ถ์ ๋ ์ ์ฉํ๋ค.
 
 [๊ฒฐ๋ก ]
 ๐ฏ empty๋ฅผ ์ด์ฉํด์ Observable์ ์ด๊ธฐํํ  ์ ์๋ค.
 ๐ฏ ์๋์ ์ผ๋ก ์ฆ์ completed ๋๋ Observable์ ๋ฆฌํดํ๊ณ  ์ถ์ ๋์๋ ์ ์ฉํ๊ฒ ์ฌ์ฉํ  ์ ์๋ค.
 */
