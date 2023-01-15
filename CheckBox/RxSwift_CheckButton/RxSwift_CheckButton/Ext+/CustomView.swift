//
//  UIView.swift
//  RxSwift_CheckButton
//
//  Created by 최진용 on 2023/01/10.
//

import UIKit

class CustomView: UIView {
    var cornerRadious: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadious
        }
    }
}
