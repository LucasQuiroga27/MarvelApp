//
//  CharacterDetailViewController.swift
//  MarvelAppMVC
//
//  Created by Lucas Quiroga on 9/06/24.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
    
    var mainView: CharacterDetailView { self.view as! CharacterDetailView}
    
    init(characterDetailModel: CharacterModel){
        super.init(nibName: nil, bundle: nil)
        mainView.configure(characterDetailModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = CharacterDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
