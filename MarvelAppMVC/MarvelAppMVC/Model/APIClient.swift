//
//  APIClient.swift
//  MarvelAppMVC
//
//  Created by Lucas Quiroga on 26/05/24.
//

import Foundation
import CryptoKit

final class ListCharactersAPIClient {
    
    private let privateKey = "d9c2a8327bd363c9c4375483c8db66855f9dfe13"
    private let publicKey = "c3c77ac36f10d1478723069b1c101873"
    
    func getCharacters(character: String?) async -> MarvelResponse? {
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(data: "\(ts)\(privateKey)\(publicKey)")
        
        /*
         URL
         https://gateway.marvel.com:443/v1/public/characters?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)&limit=12&offset=0
        */
        let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=%\(character ?? "")%&orderBy=name&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)&limit=30&offset=0")

        let (data, _) = try! await URLSession.shared.data(from: url!)
        return try! JSONDecoder().decode(MarvelResponse.self, from: data)
        
    }
    
    private func MD5(data: String) -> String{
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    
}
