//
//  LikeViewController.swift
//  tabbar
//
//  Created by 최진용 on 2022/10/13.
//

import UIKit

class LikeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

//MARK: - 알람창 처리 델리게이트
extension LikeViewController: AlertDelegate{
    func pressLogin() {
        print("login")
    }
    func pressCancel() {
        print("logOut")
    }
}
