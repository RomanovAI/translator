//
//  NetworkService.swift
//  Translator
//
//  Created by RomanovAI on 27.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import Foundation


class NetworkService {
    
    func request(urlString: String, requestModel: RequestModel, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let headers = [
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "516de88c-3131-4993-847f-0e79c8749541,bb8e125f-0c52-4833-8c46-679c65cb5d09",
            "Host": "translate.yandex.net",
            "Accept-Encoding": "gzip, deflate",
            "Content-Length": "",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        request.allHTTPHeaderFields = headers
        let task = createDataTask(request: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionTask {
        return URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    completion(.success(data))
                }
            }
        })
    }
    
}
