import RxSwift
import RxCocoa

let disposeBag = DisposeBag()
var publishRelay = PublishRelay<Any>()

publishRelay.subscribe(onNext: { element in
    print(element)
}).disposed(by: disposeBag)

publishRelay.accept("히히")


/*
 [결론]
 🐯 onError나 onCompleted를 무시하여 죽지않는 Observable 시퀀스를 만들고 싶다면 PublishRelay를 사용하자!
 */
