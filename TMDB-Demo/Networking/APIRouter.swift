//
//  APIRouter.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import Foundation
import Alamofire

protocol APIConfiguration {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var parameters: [String: String] { get }
}

enum APIRouter: APIConfiguration {
    case popularMovies
    
    var path: String {
        switch self {
        case .popularMovies:
            return "popular"
        }
    }
    var method: HTTPMethod {
        return .get
    }
    var headers: HTTPHeaders {
        return [APIHeader.acceptType: APIContentType.json]
    }
    var parameters: [String : String] {
        return [APIParameter.apiKey: Constants.apiKey,
                APIParameter.language: APILanguage.english,
                APIParameter.page: "\(1)"]
    }
}

extension APIRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var url = try Constants.baseURL.asURL().appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.headers = headers
        request = try URLEncoding.default.encode(request, with: parameters)
        return request
    }
}
