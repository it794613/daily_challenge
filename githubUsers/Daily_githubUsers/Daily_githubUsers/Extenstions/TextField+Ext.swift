//
//  TextField+Ext.swift
//  Daily_AvPlayerController
//
//  Created by 최진용 on 2023/01/02.
//

import Foundation

import UIKit

extension UITextField {
    func addLeftPadding() {
        // width값에 원하는 padding 값을 넣어줍니다.
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
