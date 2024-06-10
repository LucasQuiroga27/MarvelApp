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
    
    var characterDetailPushCoordinator: CharacterDetailPushCoordinator?
    
    override func loadView() {
        view = CharacterListView()
        tableViewDelegate = CharacterListTableViewDelegate()
        
        tableViewDataSource = CharacterListTableViewDataSource(tableView: mainView.charactersTableView)
        mainView.charactersTableView.dataSource = tableViewDataSource
        mainView.charactersTableView.delegate = tableViewDelegate
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        self.setupSearchController()
        
        tableViewDelegate?.touchedCell = { [weak self]  index in
            
            guard let dataSource = self?.tableViewDataSource else {
                return
            }
            
            let characterModel = dataSource.characters[index]
            self?.characterDetailPushCoordinator = CharacterDetailPushCoordinator(navigationController: self?.navigationController, characterModel: characterModel)
            self?.characterDetailPushCoordinator?.start()
            
        }
        
        loadCharacters()
    }
    
    private func loadCharacters() {
        Task {
            if let marvelResponse = await apiClient.getCharacters(character: nil),
                let characters = marvelResponse.data?.results {
                tableViewDataSource?.set(characters: characters)
            } else {
                print("No se pudieron cargar los personajes")
            }
        }
    }
    
    func configureNavigationBar(){
        
        self.navigationItem.title = "Marvel App"
        
        let attributes = [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)
        ]
        
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        
    }
    
    private func setupSearchController(){
        mainView.searchController.searchResultsUpdater = self
        mainView.searchController.obscuresBackgroundDuringPresentation = false
        mainView.searchController.hidesNavigationBarDuringPresentation = false
        mainView.searchController.searchBar.placeholder = "Search Characters"
        
        self.navigationItem.searchController = mainView.searchController
        self.definesPresentationContext = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }

}

extension CharacterListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        
        Task {
            if let marvelResponse = await apiClient.getCharacters(character: searchText),
                let characters = marvelResponse.data?.results {
                tableViewDataSource?.set(characters: characters)
            } else {
                print("No se pudieron cargar los personajes")
            }
        }
    }
}

extension CharacterListViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        loadCharacters()
    }
}


