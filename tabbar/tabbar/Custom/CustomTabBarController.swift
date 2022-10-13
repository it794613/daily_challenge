//
//  CustomTabBar.swift
//  tabbar
//
//  Created by 최진용 on 2022/10/13.
//

import UIKit

//TODO: - 쉐도우 주기. 코너레디우스는 줫음.

@IBDesignable
class CustomTabBar : UITabBar{
    
    
    @IBInspectable
    var cornerRadius : CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    
    func addShadow(){
        self.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
}
