//
//  TabBarController.swift
//  tabbar
//
//  Created by 최진용 on 2022/10/13.
//

import UIKit




#warning("Todo ")
// 1.


class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    enum TabBarItem{
        case Home, Order, Like, Comment, Profile
        
        var title: String{
            switch self{
            case .Home: return "홈"
            case .Order: return "주문"
            case .Like: return "즐겨찾기"
            case .Comment: return "메세지"
            case .Profile: return "프로필"
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
        if let itemTitle = item.title{
            if itemTitle == TabBarItem.Home.title{
                print("")
            }
            else{
                showAlertView()
            }
        }
    }
}
