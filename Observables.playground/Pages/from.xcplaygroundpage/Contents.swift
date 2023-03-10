import RxSwift

/*
 π¦ fromμ λ°°μ΄λ‘ μμλ₯Ό λ°μ νμ νλνλ μμλ‘μ λ°©μΆν΄μ£Όλ μ°μ°μμ΄λ€.
 */

let fromObservable = Observable.from(["π°","π€","π"])

fromObservable.subscribe { element in
    print(element)
} onCompleted: {
    print("Completed")
}

/*
 π μ€νμμΌλ³΄λ©΄, of μ°μ°μλ₯Ό μ¬μ©νμ λμ κ±°μ λκ°λ€.
 π« of μ°μ°μμ fromμ λ£μ κ²μ²λΌ λ°°μ΄μ κ·Έλλ‘ λ£μ΄μ νλ² νμΈν΄λ³΄μ.
 */
let ofObservable = Observable.of(["π°","π€","π"])
ofObservable.subscribe { element in
    print(element)
} onCompleted: {
    print("Completed")
}

/*
 [μΆλ ₯ κ²°κ³Ό λΉκ΅]
 π°
 π€
 π
 Completed
 ["π°", "π€", "π"]
 Completed
 
 π° μΆλ ₯ κ²°κ³Όλ₯Ό λ³΄λ©΄ μ μ μλ―μ΄, ofλ λ°°μ΄ κ·Έλλ‘λ₯Ό μ λ¬νλ€.
 
 [κ²°λ‘ ]
 π― λ°°μ΄μ κ° νλνλλ₯Ό Observableμ μμλ‘μ λ°©μΆμν€κ³  μΆλ€λ©΄ fromμ μ¬μ©νμ!
 */
