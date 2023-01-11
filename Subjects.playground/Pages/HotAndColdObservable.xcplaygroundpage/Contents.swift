import RxSwift

/*
 
 ❤️‍🔥 Hot Observable은 구독 여부에 관계 없이 요소를 방출해주는 Observable
 💙 Cold Observable은 구독이 되어야지 비로소 요소가 방출되는 Observable
 
 🧊 Cold Observable은 우리가 일반적으로 지금까지 사용해오던 Observable이다. 즉, of, just, from 그리고 커스텀하게 만든 Observable에 별다른 처리를 하지 않았다면 모두 Cold Observable이다.
 🧃 Cold 친구들은 구현을 해주고 나서 구독을 해주지 않으면 절대 요소가 방출되지 않는다! 말 그대로 구독하기 전까지는 꽝꽝 얼어있는 것!
 🧋 그렇다면 Hot Observable은? 구독여부에 관계없이 요소를 방출해주는 Observable이다. 대표적으로 Subject가 있다.
 🍻 쉬운 예시로 Hot Observable을 설명해보면, A라는 유튜버가 있다고 가정하자.
    -> 어느날 유튜브 알고리즘을 따라 영상들을 보다가 A의 영상을 보고 재미있어서 구독과 알람설정을 해두었다.
    -> 이 다음부터는 A 유튜버가 영상을 올릴 때마다 알람을 받게 될 것이다. (Observable에서 요소 방출)
    -> 그런데, 우리는 A를 구독하기 전의 영상에 대한 알람을 받지는 못했었다.
    -> 이와같이 구독하는 시점에 영향을 받는 Observable이 Hot Observable🔥 이다.
 ❄️ 반대로 Cold Observable로 예를 들어보면 A라는 유튜버를 구독한 순간 A가 영상을 올리는 것이다.
 
 🌸 왜 Hot Observalbe과 Cold Observable이 나뉘어 존재하는 걸까?
    🔥 HotObservable은 여러 구독자가 공유해서 사용할 수 있기 때문에 성능적인 측면에서 생각했을 때 꼭 필요한 Observable이다.
        -> 예를 들어 API를 통해 무거운 데이터를 받아온다고 가정하자.
        -> 그리고 이를 observable을 통해 결과를 방출해준다고 하자.
        -> 어차피 한 번 호출하는 것이니 Cold Observable로서 사용해도 별다른 이점은 없다.
        -> 그런데 만약 이 결과에 대해 이런저런 처리들을 해주어야 한다고 하면 그만큼 API 호출 Observalbe을 불러오게 될 것이다.
        -> 이럴 때 Hot Observable을 사용하면 여러 구독자들이 API를 호출하기 전 시점에 미리 구독을 해주고 결과가 방출되면 그 결과를 여럿이서 공유해서 사용할 수 있게 된다.
        -> 이러한 경우를 위해 Hot Observable이 필요한 것이다.
 
 🧊 Cold Observable은 구독자들이 어느 시점에 구독을 하든 같은 결과를 받지만, -> unicast
 🔥 Hot Observable은 구독자들이 구독하는 시점에 따라 전달받는 요소들이 달라진다. -> multicast
 
 [결론]
 🐯 상황에 맞게 Hot Observable이나 Cold Observable 중에 골라서 사용하자.
 🐯 Cold Observable은 구독하면 항상 같은 결과를 받지만 Hot Observable은 구독하는 시점에 따라 받게되는 결과가 달라진다.
 
 */
