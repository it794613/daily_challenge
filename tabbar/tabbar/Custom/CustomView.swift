//
//  CustomView.swift
//  tabbar
//
//  Created by 최진용 on 2022/10/13.
//

import UIKit

@IBDesignable
class CustomView: UIView{
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var addShadow: Bool = false{
        didSet{
            self.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25)
            self.layer.shadowRadius = 10
            self.layer.shadowOffset = CGSize(width: 0, height: 10)
            self.layer.shadowOpacity = 1
            self.clipsToBounds = false
        }
    }
    
}
