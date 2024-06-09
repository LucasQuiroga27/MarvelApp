//
//  CharacterListCellView.swift
//  MarvelAppMVC
//
//  Created by Lucas Quiroga on 2/06/24.
//

import Foundation
import UIKit
import Kingfisher

class CharacterListCellView: UITableViewCell {
    
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
        
        if let customFont = UIFont(name: "Roboto-Bold", size: 24) {
            label.font = customFont
        } else {
            label.font = UIFont.boldSystemFont(ofSize: 24)
        }
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupsView()
    }
    
    func setupsView(){
        
        addSubview(characterImageView)
        addSubview(characterNameView)
        
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            characterImageView.heightAnchor.constraint(equalToConstant: 180),
            characterImageView.widthAnchor.constraint(equalToConstant: 180),
            
            characterNameView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 10),
            characterNameView.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            characterNameView.centerYAnchor.constraint(equalTo: characterImageView.centerYAnchor),
            characterNameView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            
            
        ])
        
    }
    
    func configure(_ model: CharacterModel){
        self.characterNameView.text = model.name
        
        if let imagePath = model.image?.path, let imageExtension = model.image?.fileExtension {
            let completePath = "\(imagePath).\(imageExtension)"
            self.characterImageView.kf.setImage(with: URL(string: completePath))
        }
    }
}
