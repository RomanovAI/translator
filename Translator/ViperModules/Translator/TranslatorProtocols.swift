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
    
    var inputLanguage: Language { get }
    var outputLanguage: Language { get }
    var inputText: String? { get set }
    var outputText: String? { get set }
    
    func setuplanguageButton()
    func translationText(text: String)
    func tapArrowButton()
    func selectionInputLanguageButton()
    func selectionOutputLanguageButton()
    func changeSelectedLanguage(language: Language)
}

protocol TranslatorInteractorProtocol: class {

    var presenter: TranslatorPresenterProtocol?  { get set }
    
    var inputText: String? { get set }
    var outputText: String? { get set }

    var inputLanguage: Language { get set }
    var outputLanguage: Language { get set }
    
    func translationText(text: String) 
}

protocol TranslatorViewProtocol: class {

    var presenter: TranslatorPresenterProtocol?  { get set }
    
    var outputText: String? { get set }
    var inputText: String? { get set }
    var inputLanguage: Language? { get set }
    var outputLanguage: Language? { get set }
}
