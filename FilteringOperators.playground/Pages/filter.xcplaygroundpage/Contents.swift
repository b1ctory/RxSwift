import RxSwift

/*
 
 ๐ฑ CollectionType์์ ์ฌ์ฉ๋๋ filter์ ๋์ผํ ์๋ฏธ๋ก์ ์ฌ์ฉ๋๋ค.
 ๐ถ filter ์ฐ์ฐ์ ์์ ์กฐ๊ฑด์ ๋ฌ์์ฃผ๋ฉด ๊ทธ ์กฐ๊ฑด์ ๋ฐ๋ผ ๊ตฌ๋์๊ฐ ๋ฐ๋ ์์๋ค์ด ๊ฑธ๋ฌ์ง๊ฒ ๋๋ ๊ฒ์ด๋ค.
 
 */

let disposeBag = DisposeBag()

func genderObservable() -> Observable<String> {
    return Observable.create { observer in
        observer.onNext("Mr.Kim")
        observer.onNext("Ms.Kim")
        observer.onNext("Mrs.Choi")
        observer.onNext("Mrs.Park")
        observer.onNext("Ms.Lee")
        observer.onNext("Mr.Choi")
        observer.onCompleted()
        
        return Disposables.create()
    }
}

/*
 [์ถ๋ ฅ๊ฒฐ๊ณผ]
 Mrs.Choi
 Mrs.Park
 */
genderObservable().filter { name in
    return name.hasPrefix("Mrs.")
}.subscribe(onNext: { filteredGender in
    print(filteredGender)
}).disposed(by: disposeBag)

/// ์์ ๋์ผํ ๊ฒฐ๊ณผ๋ฅผ ๋์ถํ๋ ์ถ์ฝ ํํ์์ด๋ค.
genderObservable().filter {
    $0.hasPrefix("Mrs.")
}.subscribe(onNext: { filteredGender in
    print(filteredGender)
}).disposed(by: disposeBag)

/*
 ๐ฆ subscribe๋ก ๊ตฌ๋ํ๊ธฐ ์ด์ ์ filter๋ฅผ ํ๋ฒ๋ง ํธ์ถํ๋ผ๋ ๋ฒ์ ์์ผ๋ ๋ค์ํ ์กฐ๊ฑด์ filter๋ก ๋๋์ด ๊ฑธ๋ฌ์ฃผ์ด๋ ๋ฌด๋ฐฉํ๋ค.
 
 [๊ฒฐ๋ก ]
 ๐ฏ Observalbe์์ ๋ฐฉ์ถ๋๋ ์์๋ฅผ ์กฐ๊ฑด์ ๋ง๊ฒ ๊ฑธ๋ฌ์ ๊ตฌ๋์์๊ฒ ์ ๋ฌํด์ฃผ๊ณ  ์ถ๋ค๋ฉด filter ์ฐ์ฐ์๋ฅผ ์ฌ์ฉํ์!
 */
