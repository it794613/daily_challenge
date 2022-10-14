//
//  Model.swift
//  daily_challenge
//
//  Created by 최진용 on 2022/09/30.
//

import UIKit

class Model{
    
//    Model(type : "detail", text1: "hi", text2: "hellow", text3: "what's up"),
//    Model(type : "hotdeal", text1: "1", text2: "2", text3: "3"),
//    Model(type: "profile", text1: "1", text2: "2", text3: "3"),
    
//    ["전체", "핫딜", "프로필", "디테일"]
    
    enum Category : CaseIterable {
        case all
        case hotdeal
        case profile
        case detail
        
        var title: String {
            switch self {
            case .all:      return "전체"
            case .hotdeal:  return "핫딜"
            case .profile:  return "프로필"
            case .detail:   return "디테일"
            }
        }
    }
    
    var type : Category
    var text1 : String
    var text2 : String
    var text3 : String
    
    init(type : Category, text1 : String, text2: String, text3: String) {
        self.type = type
        self.text1 = text1
        self.text2 = text2
        self.text3 = text3
    }
}
