//
//  LanguageListRouter.swift
//  Translator
//
//  Created RomanovAI on 27.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import UIKit

final class LanguageListRouter: LanguageListRouterProtocol {
    
    weak var viewController: UIViewController?
    
    var onComplete: ((Language) -> Void)? // почему опционально?
    
    static func createModule(currentLanguage: Language, onComplete: ((Language) -> Void)?) -> UIViewController {
        
        let view = LanguageListViewController(nibName: nil, bundle: nil)
        let interactor = LanguageListInteractor(currentLanguage: currentLanguage)
        let router = LanguageListRouter(onComplete: onComplete)
        let presenter = LanguageListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    init(onComplete: ((Language) -> Void)?) {
        self.onComplete = onComplete
    }
    
    func dismiss(with selectedLanguage: Language) {
        onComplete?(selectedLanguage)
    }
}
