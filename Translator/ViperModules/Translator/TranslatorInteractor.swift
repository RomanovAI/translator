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
            case .failure(_):
                self.presenter?.outputText = ""
            case .success(let model):
                let outputText = model.text.joined(separator: " ")
                self.presenter?.outputText = outputText
                guard let decodeURl = text.removingPercentEncoding else { return }
                let text = Text(inputText: decodeURl, outputText: outputText)
                self.serviceContainer.localStorage.addText(text: text)

            }
        }
    }
    
}
