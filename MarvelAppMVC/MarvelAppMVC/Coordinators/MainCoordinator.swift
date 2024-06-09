//
//  MainCoordinator.swift
//  MarvelAppMVC
//
//  Created by Lucas Quiroga on 9/06/24.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator{
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let listCharactersViewController = storyBoard.instantiateViewController(withIdentifier: "CharacterListViewController")
        
        navigationController?.pushViewController(listCharactersViewController, animated: true)
    }
    
}
