import RxSwift

/*
 🧚🏻‍♂️ filteringOperator은 Observable에서 방출되는 요소를 원하는 조건에 맞추어 요소들을 걸러줄 수 있도록 도와주는 연산자이다!
 🧛🏻 기존 FoundationKit에서 제공하는 Collection Type에 적용할 수 있는 filter 연산자처럼 Observable에서 방출되는 값을 조건에 맞추어 구독자에게 전달할 것인지 여부를 결정할 수 있게 도와준다.
 🧜🏻 RxSwift에서는 FoundationKit의 filter와 사용법이 거의 동일한 filter 연산자를 베이스로 다양한 filter 연산자를 제공한다.
 🤵🏻‍♀️ 예를 들면, 단 한번의 연산자 호출로 원하는 index 번째의 요소만 전달받을 수 있도록 도와주는 연산자도 있고, 원하는 조건에 부합할 때까지만 요소를 전달받고 그 후로는 무시하는 등의 다양한 연산자를 제공한다.
 🙇🏻‍♀️ filteringOperator를 이용해서 조금 더 유연하게 요소들을 관리할 수 있으니 어디에 어떻게 사용하면 좋을지 고민하며 공부해보자!
 */

