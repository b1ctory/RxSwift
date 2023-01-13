import RxSwift

/*
 
 🚙 toArray는 Observable에서 방출된 요소들을 한번에 모아서 array로서 전달받을 수 있도록 도와주는 연산자이다.
 🚗 모든 요소들이 방출되고난 후에 한번에 array로 묶어서 전달받을 수 있다.
 🚕 또한 toArray는 RxSwift5.0 이후부터 Single로 변경되었다. 즉, 원래 구독시에 onNext를 통해서 요소를 받을 것을 Single이기 때문에 onSuccess로 요소를 받아야한다는 뜻이다.
 
 */

let disposeBag = DisposeBag()

func observable() -> Observable<Int> {
    return Observable.create { observer in
        observer.onNext(1)
        observer.onNext(2)
        observer.onNext(3)
        observer.onCompleted()
        
        return Disposables.create()
    }
}

observable().toArray()
    .subscribe(onSuccess: { array in
        print(array)
    }).disposed(by: disposeBag)

/*
 
 [출력 결과]
 [1, 2, 3]

 🚌 이런 toArray의 array로 결과를 전달해주는 특징을 이용해서 UITableView나 UICollectionView에서 유용하게 사용된다.
 🚎 예를 들어 api 호출을 통해 한 번 한 번 요소를 전달받는다면, 보통같으면 요소를 받을 때마다 기존에 선언되어있는 array 등에 요소를 추가해주고 .reloadData()를 매번 호출해주게 된다.
 🏎 하지만 toArray를 사용하면 모든 요소들을 전달받고난 후에 array에 묶인 상태로 받기 때문에 선언되어있는 array에 그대로 교체해주고 .reloadData()를 한 번만 호출시켜줘도 된다.
 🚓 toArray 연산자를 사용해서 array로 묶인 데이터는 onCompleted나 onSuccess가 호출되어야 비로소 구독자에게 전달된다.
 🚑 만약 모든 요소를 방출하고 onCompleted나 onSuccess가 호출되지 않으면 구독자는 아무런 요소를 전달받지 못하게 된다.
 
 [결론]
 🐯 모든 요소들을 전달받고서 array로 묶어서 구독자에게 전달해주고 싶다면 간편하게 toArray 연산자를 사용하자
 
 */
