//
//  CharacterModel.swift
//  MarvelAppMVC
//
//  Created by Lucas Quiroga on 27/05/24.
//

import Foundation

struct CharacterModel: Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let image: ImageModel?
    
    enum CodingKeys: String, CodingKey {
        case id, name, description
        case image = "thumbnail"
    }

}
