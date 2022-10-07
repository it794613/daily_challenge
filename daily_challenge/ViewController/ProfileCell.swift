//
//  ProfileCell.swift
//  daily_challenge
//
//  Created by 최진용 on 2022/10/07.
//

import UIKit

class ProfileCell : UITableViewCell{
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
    }
    
}
