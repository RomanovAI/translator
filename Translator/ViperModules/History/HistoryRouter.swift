//
//  HistoryRouter.swift
//  Translator
//
//  Created RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import UIKit

final class HistoryRouter: HistoryRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(localStorage: LocalStorage) -> UIViewController {

        let view = HistoryViewController(nibName: nil, bundle: nil)
        let interactor = HistoryInteractor(localStorage: localStorage)
        let router = HistoryRouter()
        let presenter = HistoryPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
