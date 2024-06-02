//
//  ViewController.swift
//  MarvelAppMVC
//
//  Created by Lucas Quiroga on 26/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Task {
            await debuggCharacters()
        }
    }
    
    private func debuggCharacters() async {
        let apiClient = ListCharactersAPIClient()
        if let response = await apiClient.getCharacters(character: "") {
            print("Personajes: \(response)")
        } else {
            print("error")
        }
    }


}


