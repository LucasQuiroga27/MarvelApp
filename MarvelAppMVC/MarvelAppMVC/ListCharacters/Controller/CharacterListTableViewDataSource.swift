//
//  CharacterListTableViewDataSource.swift
//  MarvelAppMVC
//
//  Created by Lucas Quiroga on 3/06/24.
//

import Foundation
import UIKit

final class CharacterListTableViewDataSource: NSObject, UITableViewDataSource {

    private let tableView: UITableView
    
    private(set) var characters: [CharacterModel] = []{
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private(set) var filteredCharacters: [CharacterModel] = []
    
    init(tableView: UITableView, characters: [CharacterModel] = []) {
        self.tableView = tableView
        self.characters = characters
        self.filteredCharacters = characters
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterListCellView", for: indexPath) as! CharacterListCellView
        
        let character = characters[indexPath.row]
        cell.configure(character)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "characters"
    }
    
    func set(characters: [CharacterModel?]) {
        self.characters = characters.compactMap { $0 }
    }
    
    func setFiltered(characters: [CharacterModel?]) {
        self.filteredCharacters = characters.compactMap { $0 }
    }
    
}
