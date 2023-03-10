import RxSwift

/*
 π¦¦ elementAt μ°μ°μλ λ΄κ° nλ²μ§Έ μμλ§ λ°κ³ μΆμ λ μ μ©ν μ°μ°μμ΄λ€.
 π¦­ μμλ 0λ² μΈλ±μ€λΆν° μ±μμ§μ μ μνμ.
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<String> {
    return Observable.create { observer in
        observer.onNext("π¦¦")
        observer.onNext("π¦")
        observer.onNext("π³")
        observer.onNext("π¬")
        observer.onNext("π¦­")
        observer.onCompleted()
        
        return Disposables.create()
    }
}

/*
 [μ€ν κ²°κ³Ό]
 π¬
 Completed !
 */
observable().element(at: 3)
    .subscribe(onNext: { element in
        print(element)
    }, onCompleted: {
        print("Completed !")
    }).disposed(by: disposeBag)

/*
 [κ²°λ‘ ]
 π― Observableμμ λ°©μΆλλ μμλ€ μ€ μνλ nλ²μ§Έμ μμλ§ λ°κ³  μΆλ€λ©΄ element(at: n)μ μ¬μ©ν΄μ λ°μ!
 */
