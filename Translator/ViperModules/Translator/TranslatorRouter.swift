//
//  TranslatorRouter.swift
//  Translator
//
//  Created RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import UIKit

final class TranslatorRouter: TranslatorRouterProtocol {
    
    weak var viewController: UIViewController?
    
    var onShowLanguageList: ((_ language: Language) -> Void)?
    
    static func createModule(language: Language?, onShowLanguageList: @escaping (_ language: Language) -> Void) -> UIViewController {

        let view = TranslatorViewController(nibName: nil, bundle: nil)
        let interactor = TranslatorInteractor(language: language)
        let router = TranslatorRouter(onShowLanguageList: onShowLanguageList)
        let presenter = TranslatorPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    init(onShowLanguageList: @escaping (_ language: Language) -> Void) {
        self.onShowLanguageList = onShowLanguageList
    }
    
    func showLanguageList(language: Language) {
        onShowLanguageList?(language)
    }
}
