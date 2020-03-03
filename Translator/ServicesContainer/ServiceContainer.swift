//
//  ServiceContainer.swift
//  Translator
//
//  Created by RomanovAI on 27.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

class ServiceContainer {
    
    let dataFetcher: DataFetcherService
    let localStorage: LocalStorage
    
    init() {
        self.dataFetcher = DataFetcherService()
        self.localStorage = LocalStorage()
    }
    
}

