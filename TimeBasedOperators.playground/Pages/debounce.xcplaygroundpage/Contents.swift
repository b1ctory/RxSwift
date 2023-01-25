import RxSwift

/*
 
 👩🏻‍⚕️ 일정 시간이 지나야 구독자에게 요소를 전달해주는 연산자
 🧑🏻‍⚕️ 예를 들어 debounce가 3초라면 하나의 요소가 방출된 후 3초가 지나야 그 요소를 구독자에게 전달해준다는 뜻
 👩🏻‍🦳 만약 3초가 지나기 전에 다른 요소가 방출이 되면 새롭게 그 요소가 3초가 지나고서 구독자에게 보내질 대상이 된다.
 🧑🏻‍🦳 즉, 3초가 지나고 가장 마지막 요소를 구독자에게 전달해준다.
 
 */


class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // 0.5초 뒤에 검색결과가 노출되도록
        searchTextField.rx.text
            .subscribe(onNext: { [weak self] value in
                self?.resultLabel.text = "\(value ?? "")에 대한 겸색결과"
            }).disposed(by: disposeBag)
    }
}

/*
 
 [결론]
 🐯 일정 시간 안에 연속된 값들은 모두 무시하고 일정 시간이 지나서야 가장 최근의 요소를 가지고 액션을 취하고 싶다면 debounce를 사용하자!
 🐯 예를 들어, 무언가 빠르게 연속되는 요소들은 무시하고 모두 입력을 마치고 몇 초 지나야 요소를 방출시키고 싶다면 debounce!
 
 */

