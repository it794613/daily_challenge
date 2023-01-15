//
//  CustomButton.swift
//  RxSwift_CheckButton
//
//  Created by 최진용 on 2023/01/10.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 8
        self.layer.shadowColor = CGColor(red: 184, green: 185, blue: 191, alpha: 1)
        self.layer.shadowOpacity = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
