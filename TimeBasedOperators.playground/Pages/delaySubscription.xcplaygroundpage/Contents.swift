import RxSwift

/*
 
 ๐ฎ delaySubscription์ด๋ ๋จ์ ์์ ๋ฐฉ์ถ์ ์ง์ฐ์์ผ์ฃผ๋๊ฒ ์๋๋ผ ๊ตฌ๋ ์์ฒด๋ฅผ ์ผ์  ์๊ฐ๋งํผ ์ง์ฐ์์ผ์ฃผ๋ ์ฐ์ฐ์์ด๋ค.
 ๐ญ dueTime : ์ผ๋ง๋์ ๊ตฌ๋์ ์ง์ฐ์ํฌ ๊ฒ์ธ๊ฐ?
 ๐ฐ schedular : ํด๋น ์ฝ๋๋ฅผ ์ด๋ค ์ค๋ ๋์์ ์์์ํฌ ๊ฒ์ธ์ง๋ฅผ ์ ํด์ค๋ค.
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<Int> {
    Observable.create { observer in
        observer.onNext(1)
        observer.onNext(2)
        observer.onNext(3)
        
        return Disposables.create()
    }
}

observable().delaySubscription(.seconds(2), scheduler: MainScheduler.instance)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)


/*
 
 [๊ฒฐ๋ก ]
 ๐ฏ ํน์  Observable์ ๋ช ์ด ๋์ ์ง์ฐ์์ผฐ๋ค๊ฐ ๊ตฌ๋ํ๊ณ  ์ถ์ผ๋ฉด delaySubscription์ ์ด์ฉํ์
 
 */
