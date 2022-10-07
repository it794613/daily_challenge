//
//  Component.swift
//  daily_challenge
//
//  Created by 최진용 on 2022/10/06.
//

import UIKit

class CustomButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    
    convenience init(imageName : String = "arrow.up",
                     bgColor : UIColor = UIColor(red: 217, green: 217, blue: 217, alpha: 1),
                     radius: CGFloat = 22){
        self.init(type: .system)
        self.setImage(UIImage(systemName: imageName), for: .normal)
        self.backgroundColor = bgColor
        self.layer.cornerRadius = radius
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
