//
//  CartCell.swift
//  AzureOverall
//
//  Created by Pursuit on 3/30/20.
//  Copyright © 2020 Neema Philippe. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    
    //MARK: UI OBJECTS
    lazy var cartRecipeTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var cartRecipeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = image.bounds.width / 2
        image.layer.borderWidth = 3
        return image
    }()
    
    lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    //MARK: PRIVATE FUNCTIONS
    private func addCellViews(){
        addSubview(cartRecipeTitle)
        addSubview(cartRecipeImage)
        addSubview(quantityLabel)
    }
    private func setUpCellViews(){
        setUpImage()
        setUpRecipleTitle()
        setUpQuantityLabel()
    }
    
    private func setUpImage(){
       cartRecipeImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cartRecipeImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            cartRecipeImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            cartRecipeImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            cartRecipeImage.widthAnchor.constraint(equalTo: cartRecipeImage.heightAnchor)
        ])
    }
    
    private func setUpRecipleTitle() {
        cartRecipeTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cartRecipeTitle.leftAnchor.constraint(equalTo: cartRecipeImage.rightAnchor, constant: 15),
            cartRecipeTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            cartRecipeTitle.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -5)
        ])
    }
    
    private func setUpQuantityLabel() {
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 5),
            quantityLabel.leadingAnchor.constraint(equalTo: cartRecipeTitle.leadingAnchor),
            quantityLabel.rightAnchor.constraint(equalTo: cartRecipeTitle.rightAnchor)
        ])
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        addCellViews()
//        setUpCellViews()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
