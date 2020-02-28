//
//  TranslatorProtocols.swift
//  Translator
//
//  Created RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

protocol TranslatorRouterProtocol: class {
    func showLanguageList(language: Language)
}

protocol TranslatorPresenterProtocol: class {
    func tapLanguageButton(button: Int)
    
    var currentButton: Int? { get }
    
    func getTitleButton() -> [Language]
    func setupButton()
}

protocol TranslatorInteractorProtocol: class {

    var presenter: TranslatorPresenterProtocol?  { get set }
    
    var intputLanguage: Language? { get }
    var outputLanguage: Language? { get }
}

protocol TranslatorViewProtocol: class {

    var presenter: TranslatorPresenterProtocol?  { get set }
    
    func setupButton()
}
