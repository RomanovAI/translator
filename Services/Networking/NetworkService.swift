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
