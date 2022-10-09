//
//  myTableCellController.swift
//  daily_challenge
//
//  Created by 최진용 on 2022/10/01.
//


import UIKit

class DetailCell : UITableViewCell{
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var footerLabel: UILabel!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
    }

    
}
