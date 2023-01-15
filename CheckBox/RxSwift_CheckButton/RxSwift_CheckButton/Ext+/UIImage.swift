//
//  UIImage.swift
//  RxSwift_CheckButton
//
//  Created by 최진용 on 2023/01/12.
//

import UIKit


extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
