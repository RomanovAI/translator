//
//  TranslatorRouter.swift
//  Translator
//
//  Created RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import UIKit

final class TranslatorRouter: TranslatorRouterProtocol {
    
    var navigationController: UINavigationController
    var historyNavigationController: UINavigationController
    
    weak var viewController: UIViewController?
    weak var presenter: TranslatorPresenterProtocol?
    
    var onComplete: ((Text) -> Void)? //  почему опциональный?
    
    static func createModule(serviceContainer: ServiceContainer, navigationController: UINavigationController, onComplete: ((Text) -> Void)?, historyNavigationController: UINavigationController) -> UIViewController {

        let view = TranslatorViewController(nibName: nil, bundle: nil)
        let interactor = TranslatorInteractor(serviceContainer: serviceContainer)
        let router = TranslatorRouter(navigationController: navigationController, onComplete: onComplete, historyNavigationController: historyNavigationController)
        let presenter = TranslatorPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.presenter = presenter
        
        return view
    }
    
    init(navigationController: UINavigationController, onComplete:  ((Text)-> Void)?, historyNavigationController: UINavigationController) {
        self.navigationController = navigationController
        self.onComplete = onComplete
        self.historyNavigationController = historyNavigationController
    }

    func showLanguageList(language: Language) {
        let languageListModule = LanguageListRouter.createModule(currentLanguage: language, onComplete: { [weak self] language in
            guard let self = self else { return }
            self.presenter?.changeSelectedLanguage(language: language)
            self.navigationController.popViewController(animated: true)
        })
        navigationController.pushViewController(languageListModule, animated: true)
    }
    
}
