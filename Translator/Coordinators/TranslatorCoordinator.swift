//
//  TranslatorCoordinator.swift
//  Translator
//
//  Created by RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation
import UIKit

class TranslatorCoordinator {
    
    private (set) var navigationController = UINavigationController()
    
    var currentLanguage: Language?
    
    func start() {
        showTranslatorScreen(language: nil)
    }
    
    private func showTranslatorScreen(language: Language?) {
        let translatorModule = TranslatorRouter.createModule(language: language, onShowLanguageList: {language in
            self.navigationController.popViewController(animated: true)
            self.showLanguageListScreen(language: language)
        })
        
        if navigationController.viewControllers.count == 1 {
        } else {
             navigationController.pushViewController(translatorModule, animated: true)
        }
    }
    
    private func showLanguageListScreen(language: Language) {
        let languageListModule = LanguageListRouter.createModule(language: language, onShowTranslateScreen: { language in
            self.navigationController.popViewController(animated: true)
            self.showTranslatorScreen(language: language)
        })
        navigationController.pushViewController(languageListModule, animated: true)
    }
}
