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

}

protocol HistoryInteractorProtocol: class {

    var presenter: HistoryPresenterProtocol?  { get set }
}

protocol HistoryViewProtocol: class {

    var presenter: HistoryPresenterProtocol?  { get set }
}
