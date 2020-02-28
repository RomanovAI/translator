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
    
    var currentButton: Int?
    
    func getTitleButton() -> [Language] {
        guard let interactor = interactor,
            let intputLanguage = interactor.intputLanguage,
            let outputLanguage = interactor.outputLanguage
        else { return [] }
        return [intputLanguage, outputLanguage]
    }
    
    func setupButton() {
        view?.setupButton()
    }
    
    func tapLanguageButton(button: Int) {
        guard let interactor = interactor,
        let intputLanguage = interactor.intputLanguage,
        let outputLanguage = interactor.outputLanguage
        else { return }
        if button == 0 {
            currentButton = 0
            router.showLanguageList(language: intputLanguage)
        } else  {
            currentButton = 1
            router.showLanguageList(language: outputLanguage)
        }
    }
        
}
