//
//  tableViewCell.swift
//  Daily_AvPlayerController
//
//  Created by 최진용 on 2023/01/02.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    
    static let cellId = "TableViewCell"
    let githubUserId = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func layout() {
        contentView.addSubview(githubUserId)
        githubUserId.translatesAutoresizingMaskIntoConstraints = false
        githubUserId.font = githubUserId.font.withSize(12)
        githubUserId.textColor = UIColor.darkGray
        NSLayoutConstraint.activate([
            githubUserId.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            githubUserId.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: -16),
            githubUserId.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    
}
