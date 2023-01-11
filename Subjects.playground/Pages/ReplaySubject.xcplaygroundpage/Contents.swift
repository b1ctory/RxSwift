import RxSwift

/*
 
 👚 ReplaySubject는 이전에 방출됐던 요소들을 버퍼에 저장해 두었다가 새로운 구독자가 구독되었을 때 같이 넘겨주는 방식의 Subject
 👖 behaviorSubject와는 다르게 제일 처음 구독자를 위한 초기값 설정이 필요없으며, 가장 최근에 방출되었던 요소들의 최대 개수를 지정해줄 수 있다는 점에서 다르다.
 🩲 일단 ReplaySubject는 다른 Subject와 달리 .create()로 선언한다.
 👡 가장 최근 방출된 요소들의 최대 개수는 bufferSize라는 파라메터로 받고 있다.
 👗 예를 들어 bufferSize를 2라고 하면 구독하기 전에 방출되었던 요소를 2개까지 가져와서 그 요소들을 시작으로 그 다음 방출요소들을 받는 것이다.
 
 */

let disposeBag = DisposeBag()
var replaySubject = ReplaySubject<Int>.create(bufferSize: 2)

// subscriber 1
replaySubject.subscribe(onNext: { element in
    print("subscriber1 \(element)")
}).disposed(by: disposeBag)

replaySubject.onNext(1)
replaySubject.onNext(2)


// subscriber 2
replaySubject.subscribe(onNext: { element in
    print("subscriber2 \(element)")
}).disposed(by: disposeBag)

replaySubject.onNext(3)
replaySubject.onNext(4)


// subscriber 3
replaySubject.subscribe(onNext: { element in
    print("subscriber3 \(element)")
}).disposed(by: disposeBag)

replaySubject.onNext(5)

/*
 
 [주의사항]
 ✏️ buffer에 이전 방출된 요소들을 저장하는 행위는 엄연히 메모리를 사용하는 행위이기 때문에 이미지 혹은 영상 데이터들을 ReplaySubject로 다룰 때 너무 남발하지 않는 것이 좋다.
 
 [결론]
 🐯 Subject를 구독할 때 가장 최근 방출되었던 1개 이상의 요소를 열람하고 싶을 때는 ReplaySubject를 이용하자!
 
 */
