//
//  ResponseModel.swift
//  Translator
//
//  Created by RomanovAI on 27.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

struct ResponseModel: Decodable {
    let code: Int
    let lang: String
    let text: [String]
}
