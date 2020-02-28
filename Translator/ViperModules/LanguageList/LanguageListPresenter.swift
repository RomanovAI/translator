//
//  LanguageListPresenter.swift
//  Translator
//
//  Created RomanovAI on 27.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

final class LanguageListPresenter: LanguageListPresenterProtocol {
    
    weak private var view: LanguageListViewProtocol?
    var interactor: LanguageListInteractorProtocol?
    private let router: LanguageListRouterProtocol
    
    init(view: LanguageListViewProtocol,
         interactor: LanguageListInteractorProtocol?,
         router: LanguageListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func showTranslateScreen(language: Language?) {
        if let language = language {
            router.showTranslateScreen(language: language)  
        } else {
            guard let interactor = interactor else { return }
            router.showTranslateScreen(language: interactor.language)
        }
    }
    
}
