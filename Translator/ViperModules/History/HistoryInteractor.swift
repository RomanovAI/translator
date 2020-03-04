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
    
    var translatedText: [Translate]?
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    func fetchInCoreData() {
        translatedText = coreDataStack.fetchInCoreData()
    }
    
    func removeAll() {
        coreDataStack.removeAll()
        presenter?.reloadData()
    }
    
    func remove(text: Translate) {
        coreDataStack.remove(text: text)
        presenter?.reloadData()
    }
}
