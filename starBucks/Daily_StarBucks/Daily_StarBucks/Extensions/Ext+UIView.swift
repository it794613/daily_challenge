//
//  Ext+UIImage.swift
//  Daily_StarBucks
//
//  Created by 최진용 on 2023/01/26.
//

import UIKit

extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
}
