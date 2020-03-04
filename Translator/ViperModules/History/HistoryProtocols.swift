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
     var translatedText: [Translate]? { get }
    func reloadData()
}

protocol HistoryInteractorProtocol: class {

    var presenter: HistoryPresenterProtocol?  { get set }
    var translatedText: [Translate]? { get }
    
    func fetchInCoreData()
}

protocol HistoryViewProtocol: class {

    var presenter: HistoryPresenterProtocol?  { get set }
    func reloadData()
}
