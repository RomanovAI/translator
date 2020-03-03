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
    
    var languageList: [Language]? {
        get {
            return interactor?.languageList
        }
        
    }
    
    var currentLanguage: Language? {
        get {
            return interactor?.currentLanguage
        }
    }
    
    func showTranslateScreen(with selectedLanguage: Language?) {
        if let language = selectedLanguage {
            router.dismiss(with: language)
        } else {
            guard let interactor = interactor else { return }
            router.dismiss(with: interactor.currentLanguage)
        }
    }
    
}
