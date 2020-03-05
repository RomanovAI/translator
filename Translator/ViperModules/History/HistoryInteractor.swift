//
//  HistoryInteractor.swift
//  Translator
//
//  Created RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation
import CoreData

final class HistoryInteractor: HistoryInteractorProtocol {
    
    weak var presenter: HistoryPresenterProtocol?
    let coreDataStack: CoreDataStack
    
    var arrayTranslatedText: [Translate]?
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    func fetchData() {
        arrayTranslatedText = coreDataStack.fetchData()
    }
    
    func removeAll() {
        coreDataStack.removeAll()
    }
    
    func remove(text: Translate) {
        coreDataStack.remove(text: text)
    }
    
    func search(text: String) {
       arrayTranslatedText = coreDataStack.search(text: text)
        if arrayTranslatedText?.count == 0 {
            presenter?.showFoundResults(isFound: false)
        } else {
             presenter?.showFoundResults(isFound: true)
        }
    }
}
