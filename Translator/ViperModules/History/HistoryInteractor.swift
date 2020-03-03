//
//  HistoryInteractor.swift
//  Translator
//
//  Created RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

final class HistoryInteractor: HistoryInteractorProtocol {

    weak var presenter: HistoryPresenterProtocol?
    let localStorage: LocalStorage
    
    
    var translatedText: [Text] {
        return localStorage.translatedText
    }
    
    init(localStorage: LocalStorage) {
        self.localStorage = localStorage
        localStorage.updateHandlers.append({
            self.presenter?.reloadData()
        })
    }
}
