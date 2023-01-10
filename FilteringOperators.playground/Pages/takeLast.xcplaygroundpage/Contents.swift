import RxSwift

/*
 
 🪐 takeLast는 take와 반대된다고 생각하면 된다.
 ⭐️ 예를 들어 take(2)로 Observable에서 방출되는 요소들 중 앞에서부터 2개를 구독자에게 전달해줬다면 takeLast(2)를 하게되면 Observable에서 방출되는 요소들 뒤에서부터 2개를 구독자에게 전달해준다.
 💫 takeLast(count: Int) 는 count 값만큼 뒤에서부터 요소 count개를 전달할 수 있다.
 
 */

let disposeBag = DisposeBag()

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

observable().takeLast(2)
    .subscribe(onNext: { element in
        print("\(element) 방출됨")
    }).disposed(by: disposeBag)

/*
 🫧 총 방출되는 횟수보다 초과되는 값을 넣어주면 그냥 모두 방출!
 
 [실행 결과]
 1 방출됨
 2 방출됨
 3 방출됨
 4 방출됨
 
 */
observable().takeLast(100)
    .subscribe(onNext: { element in
        print("\(element) 방출됨")
    }).disposed(by: disposeBag)

/*
 🌸 이와 같이 takeLast는 observable 시퀀스에서 모든 요소들이 다 방출되고 onCompleted 되고서 맨 마지막 요소 몇개만 가져오겠다 하는 시나리오에 유용하게 사용할 수 있다.
 ⚠️ takeLast를 사용할 Observable에서 onCompleted 이벤트가 방출되지 않으면 아무런 값이 구독자에게 전달되지 않는다.
 ⚠️ 왜냐하면 takeLast는 모든 요소가 방출되고서 마지막을 기준으로 n개의 요소를 전달해주는 것인데 그 기준점이 없다면 takeLast는 어디서부터 n개를 보내주어야 하는지 모르기 때문이다.
 
 [결론]
 🐯 모든 요소가 방출되고 난 뒤, 뒤에서부터 하나 혹은 몇개의 요소들만 전달받고 싶다면 takeLast 연산자를 사용하자!
 */
