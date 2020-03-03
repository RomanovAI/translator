//
//  LocalStorage.swift
//  Translator
//
//  Created by RomanovAI on 03.03.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

class LocalStorage {
    
    private (set) var translatedText: [Text] = []
    
    var updateHandlers = [() -> Void]()
    
    func addText(text: Text) {
        translatedText.append(text)
        notify()
    }
    
    
    func removeAll() {
        translatedText.removeAll()
        notify()
    }
    
    func notify() {
        updateHandlers.forEach{ $0() }
    }
}
