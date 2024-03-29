//
//  CheckViewController.swift
//  RxSwift_CheckButton
//
//  Created by 최진용 on 2023/01/10.
//

import UIKit
import SwiftUI
import RxCocoa
import RxSwift



class CheckViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let headLabel = UILabel()
    let subLable = UILabel()
    let firstButtonView = CustomView()
    let firstLabel = UILabel()
    let firstCheckView = CustomView()
    let firstImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    let secondButtonView = CustomView()
    let secondLabel = UILabel()
    let SecondCheckView = CustomView()
    let secondImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    let firstButton = UIButton()
    let secondButton = UIButton()
    let nextButton = UIButton()
    
//    var firstButtonState = 0
//    var secondButtonState = 0

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        creatUI()
        nextButton.addTarget(self, action: #selector(touchNextButton), for: .touchUpInside)
//        nextButton.isEnabled = false
//        nextButton.alpha = 0.3
        
        
        let firstButtonState = BehaviorRelay(value: false)
        let secondButtonState = BehaviorRelay(value: false)
        
        
        
        var isValid: Observable<Bool> {
            return Observable.combineLatest(firstButtonState, secondButtonState)
                .map{ first, second in
                    return first == true || second == true
                }
        }
        
        //버튼 이벤트에서 상태로 변환해서 옵저버블로 방출해줌. 이 상태는 firstButtonState로 받음
        firstButton.rx.tap
            .scan(false) { (latestState, newState) in !latestState }
        // 외부 스트림 값을 firstButtonState 라는 옵저버블에 보내주기 위해서 bind
            .bind(to: firstButtonState)
            .disposed(by: disposeBag)
        
        
//        firstButtonState.filter{ $0 == true }
//            .map{ !$0 }
//            .bind(to: secondButtonState)
//            .disposed(by: disposeBag)
//
//        secondButtonState.filter{ $0 == true }
//            .map { !$0 }
//            .bind(to: firstButtonState)
//            .disposed(by: disposeBag)
        
        secondButton.rx.tap
            .scan(false) { (latestState, newState) in !latestState }
            .bind(to: secondButtonState)
            .disposed(by: disposeBag)
            
        
        //받은 state를 통해서 ui를 변경함.
        firstButtonState.subscribe(onNext: { state in
            self.changeFirstButtonUI(by: state)
        }).disposed(by: disposeBag)


        secondButtonState.subscribe(onNext: { state in
            self.changeSecondButtonUI(by: state)
        }).disposed(by: disposeBag)
        
        //두개의 상태를 combineLatest로 확인하여 UI와, 버튼상태를 변경함.
        isValid.subscribe(onNext: {state in self.changeNextButtonUI(state: state)})
            .disposed(by: disposeBag)
        
        
    }
    
    
    func changeFirstButtonUI(by state: Bool) {
        if state == true {
            firstButtonView.backgroundColor = UIColor(cgColor: CGColor(red: 232/255, green: 232/255, blue: 250/255, alpha: 1))
            secondButtonView.backgroundColor = .white
        } else {
            firstButtonView.backgroundColor = UIColor.white
        }
    }
    
    func changeSecondButtonUI(by state: Bool) {
        if state == true {
            secondButtonView.backgroundColor = UIColor(cgColor: CGColor(red: 232/255, green: 232/255, blue: 250/255, alpha: 1))
            firstButtonView.backgroundColor = .white
        } else {
            secondButtonView.backgroundColor = UIColor.white
        }
    }
   
    func changeNextButtonUI(state: Bool) {
        nextButton.isEnabled = state
        if state == true {
            nextButton.alpha = 1
        } else {
            nextButton.alpha = 0.3
        }
    }
    
    
    
    
    @objc func touchNextButton() {
        print("activated")
    }
    
    
}

//MARK: - CreateUI
extension CheckViewController {
    func creatUI() {
        view.addSubview(headLabel)
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        headLabel.numberOfLines = 0
        headLabel.text = "갖고있는 질환이 있다면 \n선택해주세요"
        headLabel.setLineSpacing(spacing: 5)
        headLabel.font = UIFont.boldSystemFont(ofSize: 24)
        NSLayoutConstraint.activate([
            headLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            headLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
        
        view.addSubview(subLable)
        subLable.translatesAutoresizingMaskIntoConstraints = false
        subLable.numberOfLines = 0
        subLable.setLineSpacing(spacing: 3)
        subLable.text = "각 상태에서 피해야 하는 영양성분을 \n분석해드릴게요."
        subLable.textColor = UIColor.lightGray
        subLable.font = subLable.font.withSize(18)
        NSLayoutConstraint.activate([
            subLable.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 20),
            subLable.leadingAnchor.constraint(equalTo: headLabel.leadingAnchor)
        ])
        
        
        view.addSubview(firstButtonView)
        firstButtonView.layer.shadowOpacity = 0.1
        firstButtonView.layer.shadowOffset = CGSize(width: 0, height: 0)
        firstButtonView.cornerRadious = 12
        firstButtonView.backgroundColor = .white
        firstButtonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstButtonView.topAnchor.constraint(equalTo: subLable.bottomAnchor, constant: 50),
            firstButtonView.leadingAnchor.constraint(equalTo: subLable.leadingAnchor),
            firstButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            firstButtonView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        
        firstButtonView.addSubview(firstLabel)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.text = "기저질환이 없어요."
        firstLabel.font = UIFont.boldSystemFont(ofSize: 20)
        NSLayoutConstraint.activate([
            firstLabel.centerYAnchor.constraint(equalTo: firstButtonView.centerYAnchor),
            firstLabel.leadingAnchor.constraint(equalTo: firstButtonView.leadingAnchor , constant:  16),
            firstLabel.trailingAnchor.constraint(greaterThanOrEqualTo: firstButtonView.trailingAnchor, constant: 16)
        ])
        
        
        firstCheckView.translatesAutoresizingMaskIntoConstraints = false
        firstButtonView.addSubview(firstCheckView)
        firstCheckView.backgroundColor = UIColor(red: 100/255, green: 50/255, blue: 233/255, alpha: 1)
        NSLayoutConstraint.activate([
            firstCheckView.widthAnchor.constraint(equalToConstant: 40),
            firstCheckView.heightAnchor.constraint(equalToConstant: 40),
            firstCheckView.centerYAnchor.constraint(equalTo: firstButtonView.centerYAnchor),
            firstCheckView.trailingAnchor.constraint(equalTo: firstButtonView.trailingAnchor, constant: -30)
        ])
        firstCheckView.cornerRadious = 20
        
        //체크버튼용 이미지
        let image = UIImage(named: "check")?.resized(to: CGSize(width: 16, height: 16))
        let tintedIamge = image?.withRenderingMode(.alwaysTemplate)
        
        //체크버튼 추가

        firstCheckView.addSubview(firstImageView)
        firstImageView.translatesAutoresizingMaskIntoConstraints = false
        firstImageView.image = tintedIamge
        firstImageView.tintColor = UIColor.white
        NSLayoutConstraint.activate([
            firstImageView.centerYAnchor.constraint(equalTo: firstCheckView.centerYAnchor),
            firstImageView.centerXAnchor.constraint(equalTo: firstCheckView.centerXAnchor)
        ])

        
        view.addSubview(secondButtonView)
        secondButtonView.layer.shadowOpacity = 0.1
        secondButtonView.layer.shadowOffset = CGSize(width: 0, height: 0)
        secondButtonView.cornerRadious = 12
        secondButtonView.backgroundColor = .white
        secondButtonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondButtonView.topAnchor.constraint(equalTo: firstButtonView.bottomAnchor, constant: 24),
            secondButtonView.leadingAnchor.constraint(equalTo: subLable.leadingAnchor),
            secondButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            secondButtonView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        
        
        secondButtonView.addSubview(secondLabel)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.text = "기저질환이 있어요."
        secondLabel.font = UIFont.boldSystemFont(ofSize: 20)
        NSLayoutConstraint.activate([
            secondLabel.centerYAnchor.constraint(equalTo: secondButtonView.centerYAnchor),
            secondLabel.leadingAnchor.constraint(equalTo: secondButtonView.leadingAnchor , constant:  16),
            secondLabel.trailingAnchor.constraint(greaterThanOrEqualTo: secondButtonView.trailingAnchor, constant: 16)
        ])

        
        SecondCheckView.translatesAutoresizingMaskIntoConstraints = false
        secondButtonView.addSubview(SecondCheckView)
        SecondCheckView.backgroundColor = UIColor(red: 100/255, green: 50/255, blue: 233/255, alpha: 1)
        NSLayoutConstraint.activate([
            SecondCheckView.widthAnchor.constraint(equalToConstant: 40),
            SecondCheckView.heightAnchor.constraint(equalToConstant: 40),
            SecondCheckView.centerYAnchor.constraint(equalTo: secondButtonView.centerYAnchor),
            SecondCheckView.trailingAnchor.constraint(equalTo: secondButtonView.trailingAnchor, constant: -30)
        ])
        SecondCheckView.cornerRadious = 20
        
        
        
        SecondCheckView.addSubview(secondImageView)
        secondImageView.translatesAutoresizingMaskIntoConstraints = false
        secondImageView.image = tintedIamge
        secondImageView.tintColor = UIColor.white
        NSLayoutConstraint.activate([
            secondImageView.centerYAnchor.constraint(equalTo: SecondCheckView.centerYAnchor),
            secondImageView.centerXAnchor.constraint(equalTo: SecondCheckView.centerXAnchor)
        ])
        
        
        
        firstButtonView.addSubview(firstButton)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstButton.widthAnchor.constraint(equalTo: firstButtonView.widthAnchor),
            firstButton.heightAnchor.constraint(equalTo: firstButtonView.heightAnchor),
            firstButton.topAnchor.constraint(equalTo: firstButtonView.topAnchor),
            firstButton.leadingAnchor.constraint(equalTo: firstButtonView.leadingAnchor)
        ])
        
        
        
        secondButtonView.addSubview(secondButton)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondButton.widthAnchor.constraint(equalTo: secondButtonView.widthAnchor),
            secondButton.heightAnchor.constraint(equalTo: secondButtonView.heightAnchor),
            secondButton.topAnchor.constraint(equalTo: secondButtonView.topAnchor),
            secondButton.leadingAnchor.constraint(equalTo: secondButtonView.leadingAnchor)
        ])
        

        
        
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        nextButton.backgroundColor = UIColor(red: 100/255, green: 50/255, blue: 233/255, alpha: 1)
        nextButton.layer.cornerRadius = 8
        NSLayoutConstraint.activate([
            nextButton.heightAnchor.constraint(equalToConstant: 45),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
}


//MARK: - RxFunctions





#if DEBUG

struct ViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        CheckViewController()
    }
}

struct ViewControllerPresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerPresentable()
            .ignoresSafeArea()
    }
}

#endif
