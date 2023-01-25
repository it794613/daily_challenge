//
//  StarBucksViewController.swift
//  Daily_StarBucks
//
//  Created by 최진용 on 2023/01/15.
//

import UIKit

class StarBucksViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let titleLabel = UILabel()
    let hStack = UIStackView()
    let historyButton = UIButton()
    let progressBar = UIProgressView()
    let shadowView = UIView()
    let nextLevelLabel = UILabel()
    let underbarLabel = UILabel()
    let levelButton = UIButton()
    let adventageLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        creatUI()
        let topSegement = addTopSegmentedControl(contentView: contentView)
        topSegement.addTarget(self, action: #selector(changeIDX), for: .valueChanged)
        
        let bottomSegement = addBottomSegement(contentView: contentView)
        bottomSegement.addTarget(self, action: #selector(changeBottomIDX), for: .valueChanged)
        
        
        
        
    }
    
    @objc func changeBottomIDX(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            sender.selectedSegmentIndex = 0
            print("0")
        case 1:
            sender.selectedSegmentIndex = 1
            print("1")
        case 2:
            sender.selectedSegmentIndex = 2
            print("2")
        default:
            sender.selectedSegmentIndex = 0
            print("0")
        }
    }
    
    
    
    
    @objc func changeIDX(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            sender.selectedSegmentIndex = 0
            sender.changeUnderlinePosition()
            print("select1")

        case 1:
            sender.selectedSegmentIndex = 1
            sender.changeUnderlinePosition()
            print("select2")
        case 2:
            sender.selectedSegmentIndex = 2
            sender.changeUnderlinePosition()
            print("select3")
        default:
            print("0")
        }
    }
    
    func addTopSegmentedControl(contentView: UIView) -> UISegmentedControl {
        let segItems = ["My rewards", "How it works", ""]
        let topSegement = UISegmentedControl(items: segItems)
        topSegement.translatesAutoresizingMaskIntoConstraints = false
        // 클립투 바운스를 통해서 뷰 밖으로 넘어가는 부분은 상관없이 지워버림.
        topSegement.clipsToBounds = false

        topSegement.selectedSegmentIndex = 0

        //배경과 구분선 지우기
        topSegement.removeBorder()
        //선택시 언더바 생성과 이동
        topSegement.addUnderlineForSelectedSegment()


        contentView.addSubview(topSegement)
        NSLayoutConstraint.activate([
            topSegement.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            // 그래서 multiplier을 이용해서 사이즈를 더 키워서 첫번째와 두번째 사이즈를 키워서 사용함.
            topSegement.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.1),
            topSegement.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            topSegement.heightAnchor.constraint(equalToConstant: 35)
        ])
        return topSegement
    }
    
    func addBottomSegement(contentView: UIView) -> UISegmentedControl {
        let segItems = ["Welcome", "Green", "Gold"]
        let bottomSegment = UISegmentedControl(items: segItems)
        bottomSegment.translatesAutoresizingMaskIntoConstraints = false
        bottomSegment.clipsToBounds = false
        bottomSegment.selectedSegmentIndex = 0
        
        let backgroundImage = UIImage()
        bottomSegment.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        bottomSegment.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        bottomSegment.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)
        bottomSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 12, weight: .semibold)], for: .normal)
        bottomSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 12, weight: .semibold)], for: .selected)
        
        contentView.addSubview(bottomSegment)
        NSLayoutConstraint.activate([
            bottomSegment.topAnchor.constraint(equalTo: adventageLabel.bottomAnchor, constant: 18),
            bottomSegment.leadingAnchor.constraint(equalTo: adventageLabel.leadingAnchor, constant: -6),
            bottomSegment.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            bottomSegment.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        
        return bottomSegment
    }
}



extension StarBucksViewController {
    func creatUI() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 300),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.text = "StarBucks Rewards"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        hStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hStack)
        
        let sLabelFirst = UILabel()
        sLabelFirst.text = "9"
        sLabelFirst.font = UIFont.boldSystemFont(ofSize: 32)
        
        let sLabelbar = UILabel()
        sLabelbar.text = "/"
        sLabelbar.font = UIFont.systemFont(ofSize: 20)
        sLabelbar.textColor = UIColor.systemGray2
        
        let sLabelSecond = UILabel()
        sLabelSecond.text = "30*"
        sLabelSecond.font = UIFont.systemFont(ofSize: 24)
        sLabelSecond.textColor = UIColor(cgColor: CGColor.green)
        // 라벨추가
        hStack.addArrangedSubview(sLabelFirst)
        hStack.addArrangedSubview(sLabelbar)
        hStack.addArrangedSubview(sLabelSecond)
        
        //가로스택뷰
        hStack.axis = .horizontal
        hStack.distribution = .fillProportionally
        hStack.spacing = 8
        hStack.alignment = .center
        
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 85),
            hStack.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 3)
        ])

        
        contentView.addSubview(historyButton)
        historyButton.translatesAutoresizingMaskIntoConstraints = false
        
        //버튼 타이틀 크기에 맞게 프레임 사이즈 변경해주는 코드
        historyButton.invalidateIntrinsicContentSize()
        
//        historyButton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 3, bottom: 3, right: 5)
        historyButton.setTitleColor(UIColor(cgColor: .green), for: .normal)
        historyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        historyButton.layer.cornerRadius = 15
        historyButton.layer.borderColor = CGColor(red: 98/255, green: 163/255, blue: 109/255, alpha: 0.5)
        historyButton.titleLabel?.textColor = UIColor(cgColor: CGColor.green)
        historyButton.layer.borderWidth = 1
        historyButton.setTitle("별 히스토리", for: .normal)
        NSLayoutConstraint.activate([
            historyButton.centerYAnchor.constraint(equalTo: hStack.centerYAnchor),
            historyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            historyButton.widthAnchor.constraint(equalToConstant: 90),
            historyButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        contentView.addSubview(progressBar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.progress = 9/30
        progressBar.progressTintColor = UIColor(cgColor: CGColor.green)
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 2)
        progressBar.layer.cornerRadius = 3
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 3// 뒤에 있는 회색 track
        progressBar.subviews[1].clipsToBounds = true
        NSLayoutConstraint.activate([
            progressBar.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 14),
            progressBar.leadingAnchor.constraint(equalTo: hStack.leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: historyButton.trailingAnchor)
        ])
//
        contentView.addSubview(shadowView)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.backgroundColor = .systemGray2
        shadowView.alpha = 0.1
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 15),
            shadowView.widthAnchor.constraint(equalToConstant: view.frame.width - 20),
            shadowView.heightAnchor.constraint(equalToConstant: 60),
            shadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        contentView.addSubview(nextLevelLabel)
        nextLevelLabel.translatesAutoresizingMaskIntoConstraints = false
        nextLevelLabel.textColor = .black
        nextLevelLabel.alpha = 1
        nextLevelLabel.font = UIFont.boldSystemFont(ofSize: 12)
        nextLevelLabel.text = "Gold Level까지 21개의 별이 남았습니다."
        NSLayoutConstraint.activate([
            nextLevelLabel.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor),
            nextLevelLabel.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: 15)
        ])
        
        contentView.addSubview(underbarLabel)
        underbarLabel.translatesAutoresizingMaskIntoConstraints = false
        underbarLabel.text = "회원등급 변경 및 쿠폰 발행은 최대 24시간이 걸릴수 있습니다."
        underbarLabel.alpha = 0.5
        underbarLabel.textColor = .gray
        underbarLabel.font = UIFont.systemFont(ofSize: 12)
        NSLayoutConstraint.activate([
            underbarLabel.topAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: 10),
            underbarLabel.leadingAnchor.constraint(equalTo: nextLevelLabel.leadingAnchor)
        ])
        
        
        let membershipLabel = UILabel()
        contentView.addSubview(membershipLabel)
        membershipLabel.translatesAutoresizingMaskIntoConstraints = false
        membershipLabel.text = "멤버십 등급"
        membershipLabel.font = UIFont.boldSystemFont(ofSize: 18)
        NSLayoutConstraint.activate([
            membershipLabel.topAnchor.constraint(equalTo: underbarLabel.bottomAnchor, constant: 45),
            membershipLabel.leadingAnchor.constraint(equalTo: underbarLabel.leadingAnchor)
        ])
        

        let greenLevelLabel = UILabel()
        contentView.addSubview(greenLevelLabel)
        greenLevelLabel.translatesAutoresizingMaskIntoConstraints = false
        greenLevelLabel.text = "Green Level"
        greenLevelLabel.font = UIFont.boldSystemFont(ofSize: 30)
        greenLevelLabel.textColor = UIColor(cgColor: CGColor.green)
        NSLayoutConstraint.activate([
            greenLevelLabel.topAnchor.constraint(equalTo: membershipLabel.bottomAnchor, constant: 18),
            greenLevelLabel.leadingAnchor.constraint(equalTo: membershipLabel.leadingAnchor)
        ])
        
        contentView.addSubview(levelButton)
        levelButton.translatesAutoresizingMaskIntoConstraints = false
        levelButton.imageView?.contentMode = .scaleToFill
        let buttonImage = UIImage(systemName: "chevron.down")
        buttonImage?.withTintColor(UIColor.gray, renderingMode: .alwaysTemplate)
        levelButton.setImage(buttonImage, for: .normal)
        NSLayoutConstraint.activate([
            levelButton.centerYAnchor.constraint(equalTo: greenLevelLabel.centerYAnchor),
            levelButton.leadingAnchor.constraint(equalTo: greenLevelLabel.trailingAnchor, constant: 8),
            levelButton.widthAnchor.constraint(equalToConstant: 20),
            levelButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        let line = UIView()
        contentView.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor(cgColor: CGColor.gray)
        NSLayoutConstraint.activate([
            line.heightAnchor.constraint(equalToConstant: 1),
            line.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            line.widthAnchor.constraint(equalTo: view.widthAnchor),
            line.topAnchor.constraint(equalTo: greenLevelLabel.bottomAnchor, constant: 30)
        ])
        
        contentView.addSubview(adventageLabel)
        adventageLabel.translatesAutoresizingMaskIntoConstraints = false
        adventageLabel.text = "등급별 혜택"
        adventageLabel.font = UIFont.boldSystemFont(ofSize: 18)
        NSLayoutConstraint.activate([
            adventageLabel.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 30),
            adventageLabel.leadingAnchor.constraint(equalTo: greenLevelLabel.leadingAnchor)
        ])
        
        
        
        
        
        
    }
}

#if DEBUG
import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        StarBucksViewController()
    }
}

struct ViewControllerPresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerPresentable()
            .ignoresSafeArea()
    }
}

#endif
