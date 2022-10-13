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
    
}
