//
//  LanguageListInteractor.swift
//  Translator
//
//  Created RomanovAI on 27.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

final class LanguageListInteractor: LanguageListInteractorProtocol {

    weak var presenter: LanguageListPresenterProtocol?
    
    var language: Language
    
    init(language: Language) {
        self.language = language
    }
}
