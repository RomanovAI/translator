//
//  Request.swift
//  Translator
//
//  Created by RomanovAI on 27.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

struct RequestModel: Encodable {
    var key = "trnsl.1.1.20200227T091244Z.c81219a978415058.98d9993d7d47f47958fc6ebe931d0ee2192362f3"
    var text: String
    var lang: String
    
    init(text: String, lang: String) {
        self.text = text
        self.lang = lang
    }
}

