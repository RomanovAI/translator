//
//  TranslatorInteractor.swift
//  Translator
//
//  Created RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

final class TranslatorInteractor: TranslatorInteractorProtocol {
    
    weak var presenter: TranslatorPresenterProtocol?
    
    var intputLanguage: Language?
    var outputLanguage: Language?
    
    init(language: Language?) {
        print("language=", language)
        if let language = language {
            if presenter?.currentButton == 0 {
                intputLanguage = language
            } else {
                outputLanguage = language
            }
        } else {
             intputLanguage = Language(title: "English", code: "en")
             outputLanguage = Language(title: "Russian", code: "ru")
        }
    }
    
}
