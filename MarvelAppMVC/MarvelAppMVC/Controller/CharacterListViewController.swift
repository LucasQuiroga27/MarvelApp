//
//  ViewController.swift
//  MarvelAppMVC
//
//  Created by Lucas Quiroga on 26/05/24.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    var mainView: CharacterListView { self.view as! CharacterListView }
    let apiClient = ListCharactersAPIClient()
    
    private var tableViewDataSource: CharacterListTableViewDataSource?
    private var tableViewDelegate: CharacterListTableViewDelegate?
    
    override func loadView() {
        view = CharacterListView()
        tableViewDelegate = CharacterListTableViewDelegate()
        
        tableViewDataSource = CharacterListTableViewDataSource(tableView: mainView.charactersTableView)
        mainView.charactersTableView.dataSource = tableViewDataSource
        mainView.charactersTableView.delegate = tableViewDelegate
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            if let marvelResponse = await apiClient.getCharacters(character: nil),
               let characters = marvelResponse.data?.results {
                        tableViewDataSource?.set(characters: characters)
                    } else {
                        print("No se pudieron cargar los personajes")
                    }
        }
    }

}


