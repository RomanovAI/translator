//
//  DataFetcherService.swift
//  Translator
//
//  Created by RomanovAI on 03.03.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

class DataFetcherService {
    let dataFetcher = NetworkDataFetcher()
    
    func translateText(text: String, lang: String, completion: @escaping (Result<ResponseModel, Error>) -> Void) {
        let model = RequestModel(text: text, lang: lang)
        let urlString = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=\(model.key)&text=\(model.text)&lang=\(model.lang)"
        print("urlString==", urlString)
        dataFetcher.fetchJSONData(urlString: urlString, requestModel: model, response: completion)
    }
}
