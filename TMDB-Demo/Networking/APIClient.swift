//
//  APIClient.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import Foundation
import Alamofire

class APIError: LocalizedError {
    private var description: String
    var errorDescription: String? { return description }
    
    init(description: String) {
        self.description = description
    }
}

class APIClient {
    static func sendRequest<T: Decodable>(request: APIRouter, type: T.Type,  completion: @escaping (T?, Error?) -> Void) {
        AF.request(request).responseDecodable { (response: DataResponse<T, AFError>) in
            switch response.result {
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                debugPrint(error.errorDescription ?? "Error")
                if let data = response.data {
                    do {
                        let result = try JSONDecoder().decode(ErrorResponse.self, from: data) as ErrorResponse
                        completion(nil, APIError(description: result.statusMessage))
                    } catch {
                        completion(nil, APIError(description: "Error in parsing response."))
                    }
                } else {
                    completion(nil, APIError(description: "Error."))
                }
            }
        }
    }
}
