import RxSwift

/*
 
 ๐ window ์ฐ์ฐ์๋ buffer์ ๊ฐ์ด ์ฌ๋ฌ ์์๋ค์ ๋ฌถ์ด์ ํ ๋ฒ์ ๊ตฌ๋์์๊ฒ ์ ๋ฌํด์ฃผ๋๋ฐ [1, 2, 3] ์ด๋ ๊ฒ ์ ๋ฌํด์ฃผ์ง ์๊ณ  Observable๋ก์ ์ ๋ฌํด์ฃผ๋ ์ฐ์ฐ์
 ๐ฆ window์์๋ [1, 2, 3] ์ด๋ ๊ฒ ๋ฌถ์ด์ฃผ๋ ๊ฒ์ Observable.of(1, 2, 3) ์ด๋ ๊ฒ ์ ๋ฌํด์ฃผ๋ ๊ฒ์ด๋ผ๊ณ  ์๊ฐํ๋ฉด ๋๋ค.
 ๐ค window์ ํ๋ผ๋ฉํฐ๋ buffer์ ํ๋ผ๋ฉํฐ๋ค๊ณผ ๋ชจ๋ ๋์ผํ๋ค.
 
 */
let disposeBag = DisposeBag()
let timerOb = Observable<Int>.timer(.seconds(0), period: .seconds(1), scheduler: MainScheduler.instance)

timerOb.window(timeSpan: .seconds(3),
               count: 2,
               scheduler: MainScheduler.instance)
    .subscribe(onNext: { newObservable in
        print("New stream started")
        newObservable.subscribe(onNext: { element in
            print(element)
        }).disposed(by: disposeBag)
    }).disposed(by: disposeBag)

/*
 
 [๊ฒฐ๋ก ]
 ๐ฏ ์์๋ค์ ๋ฌถ์ด์ ๋๋ค๋ฅธ Observable๋ก ์ฒ๋ฆฌํ  ์ผ์ด ์๋ค๋ฉด buffer ๋์  window๋ฅผ ์ฌ์ฉํ์
 ๐ฏ buffer๊ฐ [0, 1] ์ด๋ ๊ฒ ์์๋ค์ ๋ฌถ์ด์ ๊ตฌ๋์์๊ฒ ์ ๋ฌํ๋ค๋ฉด window๋ Observable.of(0, 1) ์ด๋ ๊ฒ ๊ตฌ๋์์๊ฒ ์ ๋ฌํด์ค๋ค.
 
 */
