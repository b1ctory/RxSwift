import RxSwift

/*
 
 π€ delayλ Observableμμ λ°©μΆλλ μμλ₯Ό μνλ μκ°λ§νΌ μ§μ°μμΌ°λ€κ° λ°©μΆμν€λλ‘ λμμ£Όλ μ°μ°μμλλ€. λ€λ§, κ° μμλ§λ€ μ§μ°μμΌμ£Όλ κ²μ μλκ³  μ²« μμμ λν΄μλ§ μ μ©λλ€.
 π± dueTime : μΌλ§λ μμ λ°©μΆμ μ§μ°μν¬ κ²μΈκ°?
 π― schedular : μ€νμ½λλ₯Ό μ΄λ€ μ€λ λμμ μ€νμν¬ κ²μΈμ§λ₯Ό μ ν΄μ€λ€.
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<Int> {
    return Observable.create { observer in
        observer.onNext(1)
        observer.onNext(2)
        observer.onNext(3)
        observer.onNext(4)
        
        return Disposables.create()
    }
}

observable()
    .delay(.seconds(3), scheduler: MainScheduler.instance)
    .subscribe(onNext: { element in
        print(element)
    }).disposed(by: disposeBag)

/*
 
 π¦ μ£Όμν  μ μ κ΅¬λνκ³  λμ nμ΄κ° μμ λ°©μΆμ λκΈ°μν€λ κ² λΏμ΄μ§ κ΅¬λ μμ²΄λ₯Ό μ§μ°μν€λ κ²μ μλλ€.

 [κ²°λ‘ ]
 π― λ¨μν μ²« μμ λ°©μΆμ μΌμ  μκ° λμ μ§μ°μν€κ³  μΆλ€λ©΄ delay μ°μ°μλ₯Ό μ°μ
 
 */
