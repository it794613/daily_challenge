//
//  ViewController.swift
//  RxSwift_CheckButton
//
//  Created by 최진용 on 2023/01/10.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        creatUI()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let CheckViewController = CheckViewController()
        CheckViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(CheckViewController, animated: true)
    }
    
    
}


//MARK: - codeBaseUI
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
        button.addTarget(self, action: #selector(self.buttonClicked(_:)), for: .touchUpInside)
    }
}
