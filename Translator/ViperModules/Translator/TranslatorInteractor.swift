//
//  TranslatorInteractor.swift
//  Translator
//
//  Created RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

final class TranslatorInteractor: TranslatorInteractorProtocol {
    
    weak var presenter: TranslatorPresenterProtocol?
    
    let serviceContainer: ServiceContainer
    
    var inputLanguage: Language
    var outputLanguage: Language
    
    var inputText: String?
    var outputText: String?
    
    init(serviceContainer: ServiceContainer) {
        self.serviceContainer = serviceContainer
        self.inputLanguage = Language(title: "English", code: "en")
        self.outputLanguage = Language(title: "Russian", code: "ru")
    }
    
    func translationText(text: String) {
        let lang = "\(inputLanguage.code)-\(outputLanguage.code)"
        serviceContainer.dataFetcher.translateText(text: text, lang: lang) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let model):
                self.presenter?.outputText = model.text.joined(separator: " ")
                self.saveInCoreData(inputText: self.inputText, outputText: self.outputText)
            case .failure(_):
                 self.presenter?.outputText = ""
            }
        }
    }
    
    private func saveInCoreData(inputText: String?, outputText: String?) {
        serviceContainer.coreDataStack.saveInCoreData(inputText: inputText, outputText: outputText)
    }
    
}
