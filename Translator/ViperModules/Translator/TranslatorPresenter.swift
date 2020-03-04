//
//  TranslatorPresenter.swift
//  Translator
//
//  Created RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

final class TranslatorPresenter: TranslatorPresenterProtocol {
    
    weak private var view: TranslatorViewProtocol?
    var interactor: TranslatorInteractorProtocol?
    private let router: TranslatorRouterProtocol
    
    init(view: TranslatorViewProtocol,
         interactor: TranslatorInteractorProtocol?,
         router: TranslatorRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    var inputLanguage: Language {
        get {
            return interactor!.inputLanguage // как убрать ! ???
        }
        set {
            interactor?.inputLanguage = newValue
            view?.inputLanguage = interactor?.inputLanguage
        }
    }
    
    var outputLanguage: Language {
        get {
            return interactor!.outputLanguage
        }
        set {
            interactor?.outputLanguage = newValue
            view?.outputLanguage = interactor?.outputLanguage
        }
    }
    
    var inputText: String? {
        get {
            return interactor?.inputText 
        }
        set {
            interactor?.inputText = newValue
            view?.inputText = interactor?.inputText
        }
    }
    
    var outputText: String? {
        get {
            return interactor?.outputText
        }
        set {
            interactor?.outputText = newValue
            view?.outputText = interactor?.outputText
        }
    }
    
    private var selectedIndexLanguage: Int?
    
    func setuplanguageButton() {
        view?.inputText = inputText
        view?.outputText = outputText
    }
    
    func translationText(text: String) {
        guard let interactor = interactor, let encodeString = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        interactor.inputText = text
        interactor.translationText(text: encodeString)
    }
    
    func selectionInputLanguageButton() {
        guard let interactor = interactor else { return }
        selectedIndexLanguage = 0
        router.showLanguageList(language: interactor.inputLanguage)
    }
    
    func selectionOutputLanguageButton() {
        selectedIndexLanguage = 1
        guard let interactor = interactor else { return }
        router.showLanguageList(language: interactor.outputLanguage)
    }
    
    func tapArrowButton() {
        guard let interactor = interactor else { return }
        var temporaryLanguage: Language
        temporaryLanguage = interactor.inputLanguage
        inputLanguage = interactor.outputLanguage
        outputLanguage = temporaryLanguage
        
        var temporaryText: String?
        temporaryText = interactor.inputText
        inputText = interactor.outputText
        outputText = temporaryText
    }
    
    func changeSelectedLanguage(language: Language) {
        if selectedIndexLanguage == 0 {
            if outputLanguage.title != language.title {
                inputLanguage = language
            }
        } else {
            if inputLanguage.title != language.title {
                outputLanguage = language
            }
        }
    }
}
