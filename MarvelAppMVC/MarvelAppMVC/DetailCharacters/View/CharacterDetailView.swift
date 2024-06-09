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
        if let customFont = UIFont(name: "Roboto-Bold", size: 22) {
            label.font = customFont
        } else {
            label.font = UIFont.boldSystemFont(ofSize: 22)
        }
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Descripción:"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let characterDescriptionView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.italicSystemFont(ofSize: 16)
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
        addSubview(descriptionLabel)
        addSubview(characterDescriptionView)
        
        NSLayoutConstraint.activate([
            
            characterNameView.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterNameView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 12),
            characterNameView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 12),
            characterNameView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -12),
            
            characterImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterImageView.topAnchor.constraint(equalTo: characterNameView.bottomAnchor, constant: 20),
            characterImageView.heightAnchor.constraint(equalToConstant: 250),
            characterImageView.widthAnchor.constraint(equalToConstant: 250),
            
            descriptionLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                        
            characterDescriptionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            characterDescriptionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            characterDescriptionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
            
        ])
        
    }
    
    func configure(_ model: CharacterModel){
        self.characterNameView.text = model.name
        //self.characterDescriptionView.text = model.description
        self.characterDescriptionView.text = (model.description?.isEmpty ?? true) ? "No data to display" : model.description

        
        if let imagePath = model.image?.path, let imageExtension = model.image?.fileExtension {
            let completePath = "\(imagePath).\(imageExtension)"
            self.characterImageView.kf.setImage(with: URL(string: completePath))
        }
    }
}
