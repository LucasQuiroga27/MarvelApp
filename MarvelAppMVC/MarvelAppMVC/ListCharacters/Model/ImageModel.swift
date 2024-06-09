//
//  ImageModel.swift
//  MarvelAppMVC
//
//  Created by Lucas Quiroga on 27/05/24.
//

import Foundation

struct ImageModel: Decodable {
    
    let path: String?
    let fileExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case fileExtension = "extension"
    }
}
