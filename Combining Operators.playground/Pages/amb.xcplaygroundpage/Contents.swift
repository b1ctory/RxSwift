import RxSwift

/*
 
 ๐  amb๋ ambiguous์ ์ฝ์ด์ด๋ค. amb๋ ์ฌ๋ฌ Observable์ ๊ตฌ๋ํ๊ณ  ์๋ค๊ฐ ๋จผ์  ์์๊ฐ ๋ฐฉ์ถ๋๋ Observable์ ์ฑํํ๊ณ  ๋๋จธ์ง๋ ๋ฌด์ํ๋๋ก ๋์์ฃผ๋ ์ฐ์ฐ์์ด๋ค.
 
 */
let disposeBag = DisposeBag()

let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

left.amb(right)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

left.onNext(0)
right.onNext(100)
right.onNext(200)
right.onNext(300)

/*
 
 ๐ left์์ ์์๋ฅผ ํ๋ฒ ๋ฐฉ์ถ์ํค๊ณ  ๋๋ right์์ ์๋ฌด๋ฆฌ ์์๋ฅผ ๋ฐฉ์ถ์์ผ๋ ๊ตฌ๋์์๊ฒ ์ ๋ฌ๋์ง ์๋๋ค.
 ๐งข ๊ทธ๋ฆฌ๊ณ  amb๋ ์์ธ์์ด Observable์์ ๋ฐฉ์ถ์์ผ์ค ์์์ ํ์์ด ๋์ผํด์ผ ์ปดํ์ผ ์๋ฌ๊ฐ ์๋๋ค!
 ๐ API๋ฅผ ํธ์ถํ  ์ ์๋ ์๋ฒ A, B๊ฐ ์๋ค๊ณ  ํ  ๋ A ์๋ฒ์ ํธ๋ํฝ์ด ๋ชฐ๋ฆฌ๋ ๊ฒฝ์ฐ ํธ๋ํฝ์ด ๋ ๋ชฐ๋ ค์๋ B ์๋ฒ๊ฐ ๋ ๋น ๋ฅผ ๊ฒ์ด๋ค. ์ด๋ฐ ๊ฒฝ์ฐ์ ๋ ์๋ฒ์ API๋ฅผ ํตํด ๋ฐ์ดํฐ ์์ฒญ์ ๋ณด๋ด์ ๋ฐ์ดํฐ๊ฐ ๋จผ์  ๋์ฐฉํ๋ ์ชฝ์ API๋ฅผ ์ ํํ๋ ์์ ๊ตฌํํ  ์ ์๋ค.
 
 [๊ฒฐ๋ก ]
 ๐ฏ ๋ ์ค ๋จผ์  ์์๊ฐ ๋ฐฉ์ถ๋๋ Observable์ ์ฑํํ๊ณ  ๋๋จธ์ง Observable์ ์ฌ์ฉ ์ํ๊ฒ ๋ค ํ๋ ๊ฒฝ์ฐ amb๋ฅผ ์ฌ์ฉ!
 
 */
