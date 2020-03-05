//
//  HistoryProtocols.swift
//  Translator
//
//  Created RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

protocol HistoryRouterProtocol: class {
    
}

protocol HistoryPresenterProtocol: class {
    var arrayTranslatedText: [Translate]? { get }
    func fetchData()
    func removeAll()
    func remove(text: Translate)
    func search(text: String)
    
    func showFoundResults(isFound: Bool)
}

protocol HistoryInteractorProtocol: class {
    
    var presenter: HistoryPresenterProtocol?  { get set }
    var arrayTranslatedText: [Translate]? { get }
    
    func fetchData()
    func removeAll()
    func remove(text: Translate)
    func search(text: String)
}

protocol HistoryViewProtocol: class {
    
    var presenter: HistoryPresenterProtocol?  { get set }
    func showLabel(isHidden: Bool)
    func reloadData()
}
