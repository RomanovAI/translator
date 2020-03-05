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

    var arrayTranslatedText: [Translate]? {
        get {
            return interactor?.arrayTranslatedText
        }
    }
    
    init(view: HistoryViewProtocol,
        interactor: HistoryInteractorProtocol?,
        router: HistoryRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func fetchData() {
        interactor?.fetchData()
        view?.showLabel(isHidden: true)
        reloadData()
    }
    
    func removeAll() {
        interactor?.removeAll()
        fetchData()
    }
    
    private func reloadData() {
        view?.reloadData()
    }
    
    func remove(text: Translate) {
        interactor?.remove(text: text)
        fetchData()
    }
    
    func search(text: String) {
        interactor?.search(text: text)
        reloadData()
    }
    
    func showFoundResults(isFound: Bool) {
        view?.showLabel(isHidden: isFound)
    }

}
