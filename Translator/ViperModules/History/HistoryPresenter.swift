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

    init(view: HistoryViewProtocol,
        interactor: HistoryInteractorProtocol?,
        router: HistoryRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

}
