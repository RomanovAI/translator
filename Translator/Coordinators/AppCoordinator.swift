//
//  AppCoordinator.swift
//  Translator
//
//  Created by RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func start() {
        let tabBarController = UITabBarController()
        
        window.rootViewController = tabBarController
        let translatorCoordinator = TranslatorCoordinator()
        let historyCoordinator = HistoryCoordinator()
        translatorCoordinator.start()
        historyCoordinator.start()
        
        tabBarController.viewControllers = [
            translatorCoordinator.navigationController,
            historyCoordinator.navigationController
        ]
       
    }
}
