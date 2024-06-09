//
//  CharacterDetailView.swift
//  MarvelAppMVC
//
//  Created by Lucas Quiroga on 9/06/24.
//

import Foundation
import UIKit

class CharacterDetailView: UIView {
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let characterNameView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let characterDescriptionView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.italicSystemFont(ofSize: 12)
        label.textColor = UIColor.systemGray
        return label
    }()
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupsView()
    }
    
    func setupsView(){
        
        backgroundColor = .systemBackground
        
        addSubview(characterImageView)
        addSubview(characterNameView)
        addSubview(characterDescriptionView)
        
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            characterImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 12),
            characterImageView.heightAnchor.constraint(equalToConstant: 200),
            characterImageView.widthAnchor.constraint(equalToConstant: 200),
            
            characterNameView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 10),
            characterNameView.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            characterNameView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            characterDescriptionView.leadingAnchor.constraint(equalTo: characterNameView.leadingAnchor,constant: 20),
            characterDescriptionView.topAnchor.constraint(equalTo: characterNameView.bottomAnchor),
            characterDescriptionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            
        ])
        
    }
    
    func configure(_ model: CharacterModel){
        self.characterNameView.text = model.name
        self.characterDescriptionView.text = model.description
        
        if let imagePath = model.image?.path, let imageExtension = model.image?.fileExtension {
            let completePath = "\(imagePath).\(imageExtension)"
            self.characterImageView.kf.setImage(with: URL(string: completePath))
        }
    }
}
