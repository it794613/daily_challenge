//
//  TabBarController.swift
//  tabbar
//
//  Created by 최진용 on 2022/10/13.
//

import UIKit




#warning("Todo ")
// 2. 커스텀 탭바 에서 cornerRadius주고, shadow 주기.
// 3. 알람뷰에서 전체 opacity 들어갔는데 이거 문제있음. 고쳐야함.


class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    enum TabBarItem{
        case Home, Order, Like, Comment, Profile
        
        var title: String{
            switch self{
            case .Home: return "home"
            case .Order: return "order"
            case .Like: return "like"
            case .Comment: return "comment"
            case .Profile: return "profile"
            }
        }
    }
    
    /// 알람뷰를 보여주는 함수
    func showAlertView(){
        let tabbarStoryBoard = UIStoryboard(name: "AlertView", bundle: nil)
        let alertView = tabbarStoryBoard.instantiateViewController(withIdentifier: "alertView")
        alertView.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        alertView.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(alertView, animated: true)
    }
    
    
    
}

extension TabBarController: UITabBarControllerDelegate{
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == TabBarItem.Home.title{
            
        }
        else{
            showAlertView()
        }
    }
}
