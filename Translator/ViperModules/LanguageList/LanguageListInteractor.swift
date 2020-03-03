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
    
    var currentLanguage: Language
    
    let languageList = [
        Language(title: "English", code: "en"),
        Language(title: "Russian", code: "ru"),
        Language(title: "Spanish", code: "es"),
        Language(title: "Вьетнамский", code: "vi"),
        Language(title: "Иврит", code: "he"),
        Language(title: "Лаосский", code: "lo"),
        Language(title: "Малагасийский", code: "mg"),
        Language(title: "Хинди", code: "hi"),
        Language(title: "Урду", code: "ur")
    ]
    
    init(currentLanguage: Language) {
        self.currentLanguage = currentLanguage
    }
    
}
