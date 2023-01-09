//
//  Models.swift
//  Daily_githubUsers
//
//  Created by 최진용 on 2023/01/05.
//

import Foundation
import UIKit

struct Users: Decodable {
    var users: [User]
}

struct User: Decodable {
    let login: String
}
