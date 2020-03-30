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
        label.textAlignment = .center
        return label
    }()
    
    lazy var cartRecipeImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    
    //MARK: PRIVATE FUNCTIONS
    private func addCellViews(){
        addSubview(cartRecipeTitle)
        addSubview(cartRecipeImage)
        addSubview(quantityLabel)
    }
    private func setUpCellViews(){
        setUpCartStackView()
    }
    
    private func setUpCartStackView(){
        let stackView = UIStackView(arrangedSubviews: [cartRecipeTitle, cartRecipeImage, quantityLabel])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
