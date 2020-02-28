//
//  LanguageListProtocols.swift
//  Translator
//
//  Created RomanovAI on 27.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

protocol LanguageListRouterProtocol: class {
    func showTranslateScreen(language: Language) 
}

protocol LanguageListPresenterProtocol: class {
    func showTranslateScreen(language: Language?)
}

protocol LanguageListInteractorProtocol: class {

    var presenter: LanguageListPresenterProtocol?  { get set }
    
    var language: Language { get set }
}

protocol LanguageListViewProtocol: class {

    var presenter: LanguageListPresenterProtocol?  { get set }
}
