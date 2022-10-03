//
//  CustomView.swift
//  daily_challenge
//
//  Created by 최진용 on 2022/09/30.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    @IBInspectable
    
    var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    var isCircle: Bool = false {
        didSet {
            if isSquare() && isCircle {
                self.layer.cornerRadius = self.frame.height/2
            }
        }
    }
    
    /// 정사각형인지 확인
    /// - Returns: 맞으면 true반환
    fileprivate func isSquare() -> Bool {
        return self.frame.width == self.frame.height
    }
    
}
