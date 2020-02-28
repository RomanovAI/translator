//
//  HistoryCoordinator.swift
//  Translator
//
//  Created by RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation
import UIKit

class HistoryCoordinator {
    
    private (set) var navigationController = UINavigationController()
    
    func start() {
        let module = HistoryRouter.createModule()
        navigationController.pushViewController(module, animated: true)
    }
    
}
