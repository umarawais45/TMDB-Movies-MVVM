//
//  ErrorResponse.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import Foundation

struct ErrorResponse : Decodable {
    let statusCode: Int
    let statusMessage: String
    let success: Bool
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = try values.decode(Int.self, forKey: .statusCode)
        statusMessage = try values.decode(String.self, forKey: .statusMessage)
        success = try values.decode(Bool.self, forKey: .success)
    }
}
