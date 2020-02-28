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
    
    func fetchJSONData(urlString: String, requestModel: RequestModel, response: @escaping (ResponseModel?) -> Void) {
        networking.request(urlString: urlString, requestModel: requestModel, completion: { (data, error) in
            if let error = error {
                print("ERROR==", error)
                response(nil)
            }
            let decoded = self.decodeJSON(type: ResponseModel.self, data: data)
            response(decoded)
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
        } catch let jsonError {
            print("jsonError==", jsonError)
            return nil
        }
    }
}
