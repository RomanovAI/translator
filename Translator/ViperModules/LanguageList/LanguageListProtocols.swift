//
//  LanguageListProtocols.swift
//  Translator
//
//  Created RomanovAI on 27.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

protocol LanguageListRouterProtocol: class {
    func dismiss(with selectedLanguage: Language)
}

protocol LanguageListPresenterProtocol: class {
    var languageList: [Language]? { get }
    var currentLanguage: Language? { get }
    
    func showTranslateScreen(with selectedLanguage: Language?)
}

protocol LanguageListInteractorProtocol: class {

    var presenter: LanguageListPresenterProtocol?  { get set }
    var currentLanguage: Language { get }
    var languageList: [Language] { get }
    
}

protocol LanguageListViewProtocol: class {

    var presenter: LanguageListPresenterProtocol?  { get set }
}
