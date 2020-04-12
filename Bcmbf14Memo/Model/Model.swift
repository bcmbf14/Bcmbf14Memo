//
//  Model.swift
//  Bcmbf14Memo
//
//  Created by jongchankim on 2020/04/13.
//  Copyright © 2020 jongchankim. All rights reserved.
//

import Foundation

class Memo {
    var content: String
    var insertData : Date
    
    init(content: String){
        self.content = content
        insertData = Date()
    }
    
    
    static var dummyMemoList = [
        Memo(content: "Lorem Ipsum"),
        Memo(content: "🥰 + 👍 = ❤️")
    
    ]
}
