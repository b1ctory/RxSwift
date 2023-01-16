import RxSwift

/*
 
 🐬 materialize와 dematerialize는 RxSwift를 사용할 때 에러 처리를 도와주는 연산자
 🦊 materialize는 각 요소들을 이벤트 타입으로 감싸서 넘겨주는 연산자
 🐵 dematerialize는 이벤트 타입으로 감싸져 있는 것을 풀어서 넘겨준다.
 
 🦏 materialize는 Observable에서 방출되는 이벤트들을 이벤트 타입으로 감싸서 넘겨주는 연산자이다.
 🐆 materialize를 통해서 방출되는 요소 뿐 아니라 어떤 이벤트를 통해 요소가 전달된 것인지 등을 확인할 수 있다.
 🦒 materialize로 이벤트를 모두 분해했다면 다시 일반적인 요소로 반환시켜 주는 것이 dematerialize의 역할이다.
 🦙 이렇게 materialize와 dematerialize는 주로 쌍으로 많이 사용된다.
 🐖 예를 들어 원래같으면 error 이벤트가 방출되면 해당 시퀀스는 아무것도 못하고 바로 죽는데, materialize로 분해해서 error에 대한 처리를 하고 (예를 들면 에러 대신 -1을 전달) dematerialize를 통해 원래 형태로 변환해서 구독자에게 전달해주는 방식으로 사용!
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<Int> {
    return Observable.create { observer in
        observer.onNext(1)
        observer.onNext(2)
                observer.onError(NSError())
                observer.onCompleted()
        
        return Disposables.create()
    }
}

observable()
    .materialize()
    .map { event -> Event<Int> in
        switch event {
        case .error:
            return .next(-1)
        default:
            return event
        }
    }
    .dematerialize()
    .subscribe(onNext: { element in
        print(element)
    }, onCompleted: {
        print("completed")
    }).disposed(by: disposeBag)

/*
 
 [실행 결과]
 1
 2
 -1
 completed

 🐘 원래대로라면 error가 방출되게 되면 시퀀스가 바로 죽어버리는데, materialize()를 통해서 이벤트 타입으로 감싸진 에러를 받아서 map()으로 에러 처리를 해주게 되면 시퀀스도 죽지 않게 되고 정상적으로 completed시킬 수 있는 것이다.
 
 [결론]
 🐯 이런식으로 에러 처리를 하고 안전하게 시퀀스를 종료하고 싶다면 materialize와 dematerialize를 함께 사용해보도록 하자!
 
 */
