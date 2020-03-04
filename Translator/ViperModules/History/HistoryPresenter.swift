//
//  HistoryPresenter.swift
//  Translator
//
//  Created RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

final class HistoryPresenter: HistoryPresenterProtocol {

    weak private var view: HistoryViewProtocol?
    var interactor: HistoryInteractorProtocol?
    private let router: HistoryRouterProtocol

    var translatedText: [Translate]? {
        get {
            guard let interactor = interactor else { return [] }
            return interactor.translatedText
        }
    }
    
    init(view: HistoryViewProtocol,
        interactor: HistoryInteractorProtocol?,
        router: HistoryRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func reloadData() {
        interactor?.fetchInCoreData()
        view?.reloadData()
    }

}
