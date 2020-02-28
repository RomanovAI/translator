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
    
    var onShowTranslateScreen: ((_ language: Language) -> Void)?
    
    static func createModule(language: Language, onShowTranslateScreen: @escaping (_ language: Language) -> Void) -> UIViewController {
        
        let view = LanguageListViewController(nibName: nil, bundle: nil)
        let interactor = LanguageListInteractor(language: language)
        let router = LanguageListRouter(onShowTranslateScreen: onShowTranslateScreen)
        let presenter = LanguageListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    init(onShowTranslateScreen: @escaping (_ language: Language) -> Void) {
        self.onShowTranslateScreen = onShowTranslateScreen
    }
    
    func showTranslateScreen(language: Language) {
        onShowTranslateScreen?(language)
    }
}
