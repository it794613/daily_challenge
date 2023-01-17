//
//  ViewController.swift
//  Daily_StarBucks
//
//  Created by 최진용 on 2023/01/15.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        creatUI()
    }
    
    @objc func buttonClicked() {
        let nextView = StarBuckViewController()
        nextView.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    


}

extension MainViewController {
    func creatUI() {
        let button = UIButton()
        view.addSubview(button)
        button.setTitle("다음 창 띄우기", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
}


