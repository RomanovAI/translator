//
//  NetworkDataFetcher.swift
//  Translator
//
//  Created by RomanovAI on 27.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
    
    let networking = NetworkService()
    
    func fetchJSONData(urlString: String, requestModel: RequestModel, response: @escaping (Result<ResponseModel, Error>) -> Void) {
        networking.request(urlString: urlString, requestModel: requestModel, completion: { result in
            switch result {
            case .failure(let error):
                response(.failure(error))
            case .success(let object):
                guard let model = self.decodeJSON(type: ResponseModel.self, data: object) else { return }
                response(.success(model))
            }
        })
    }
    
    private func decodeJSON(type: ResponseModel.Type, data: Data?) -> ResponseModel? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let str = String(decoding: data, as: UTF8.self)
            print("str==", str)
            let object = try decoder.decode(ResponseModel.self, from: data)
            return object
        } catch {
            return nil
        }
    }
}
