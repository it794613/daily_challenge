//
//  Model.swift
//  daily_challenge
//
//  Created by 최진용 on 2022/09/30.
//

import UIKit

class Model{
    var type : String
    var text1 : String
    var text2 : String
    var text3 : String
    init(type : String, text1 : String, text2: String, text3: String) {
        self.type = type
        self.text1 = text1
        self.text2 = text2
        self.text3 = text3
    }
}
