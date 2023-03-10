import RxSwift

/*
 
 ๐ต Rx์์ map์ Observable์์ ์๋ํ๋ค๋ ์ ๋ง ์ ์ธํ๋ฉด Foundation์์ ์ ๊ณตํ๋ map๊ณผ Rx์์ ์ ๊ณตํ๋ map์ ๊ฑฐ์ ๋์ผํ๋ค.
 
 */

var disposeBag = DisposeBag()

func observable() -> Observable<Int> {
    return Observable.create { observer in
        observer.onNext(1)
        observer.onNext(2)
        observer.onNext(3)
        observer.onNext(4)
        observer.onCompleted()
        
        return Disposables.create()
    }
}

observable()
    .map { $0 * 2 }
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 [์คํ๊ฒฐ๊ณผ]
 2
 4
 6
 8

 ๐ ๊ธฐ์กด map์์๋ ๊ทธ๋ ๋ฏ ๋จ์ํ ์ค๊ฐ์ ๊ฐ๋จํ ๊ณ์ฐ์ด ํ์ํ  ๋์๋ ๋ง์ด ์ฌ์ฉ๋์ง๋ง ์ค๊ฐ์ ํ์์ ๋ณํํ๋ ์ผ๋ก๋ ์ ์ฉํ๊ฒ ์ฌ์ฉ๋๋ค.
 ๐ ์๋ฅผ ๋ค์ด CGFloat ํ์์ผ๋ก ๋ฐฉ์ถ๋๋ ์์๋ค์ ์ค๊ฐ์ map์ ์ฌ์ฉํด์ String์ผ๋ก ๋ฐ๊พธ๊ฑฐ๋ Int ํ์์ผ๋ก ๋ฐ๊ฟ์ฃผ๋ ๋ฑ ํ์ ๋ณํ์ ์์ผ์ฃผ๋ ๊ฒ์ด๋ค.
 ๐ ๊ทธ๋ ๊ฒ๋๋ฉด Observable์ ๊ตฌ๋ํ๋ ๊ตฌ๋์๋ CGFloat์ ํ์์ผ๋ก ์์๋ฅผ ๋ฐ๋ ๊ฒ์ด ์๋ map์ ํตํด ๋ณํ๋ ํ์์ผ๋ก ์์๋ฅผ ๋ฐ๋ ๊ฒ์ด๋ ๋ฐ๋ก onNext์์ ์ํ๋ ํ์์ผ๋ก ๋ณ๊ฒฝํด์ฃผ๋ ์ ์ฒ๋ฆฌ๊ฐ ํ์์์ด ๋ฐ๋ก ์ฌ์ฉํ  ์ ์๋ ๊ฒ!
 */

struct Student {
    var name: String
    var grade: Int
}

func observableTwo() -> Observable<Student> {
    return Observable.create { observer in
        observer.onNext(Student(name: "joy", grade: 1))
        observer.onNext(Student(name: "james", grade: 2))
        observer.onNext(Student(name: "teresa", grade: 1))
        observer.onNext(Student(name: "pote", grade: 2))
        observer.onNext(Student(name: "boaz", grade: 3))
        observer.onNext(Student(name: "havier", grade: 3))
        
        return Disposables.create()
    }
}

observableTwo()
    .map { $0.grade }
    .subscribe(onNext: { grade in
        print("\(grade) grade")
    }).disposed(by: disposeBag)

/*
 
 [๊ฒฐ๋ก ]
 ๐ฏ Observable์ ํตํด์ ๋ฐฉ์ถ๋๋ ๋ชจ๋  ์์์ ๋ํด์ ์ค๊ฐ์ ๊ณ์ฐ์ ํ๊ฑฐ๋ ํ์์ ๋ณ๊ฒฝ์์ผ์ฃผ๊ณ  ์ถ์ ๋ ๊ตณ์ด ๊ตฌ๋ํด์ ๊ณ์ฐํ๊ฑฐ๋ ํ์์ ๋ณ๊ฒฝํ์ง ์๊ณ  map์ผ๋ก ๊ฐํธํ๊ฒ ์ฒ๋ฆฌ ๊ฐ๋ฅํ๋ค.
 
 */
