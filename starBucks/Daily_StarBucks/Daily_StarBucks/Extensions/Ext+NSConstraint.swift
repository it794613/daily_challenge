//
//  Ext+NSConstraint.swift
//  Daily_StarBucks
//
//  Created by 최진용 on 2023/01/27.
//

import UIKit


extension NSLayoutConstraint
{
    func withPriority(_ priority: Float) -> NSLayoutConstraint
    {
        self.priority = UILayoutPriority(priority)
        return self
    }
}
