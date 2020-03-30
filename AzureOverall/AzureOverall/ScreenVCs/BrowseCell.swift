//
//  BrowseCell.swift
//  AzureOverall
//
//  Created by Pursuit on 3/28/20.
//  Copyright © 2020 Neema Philippe. All rights reserved.
//

import UIKit

class BrowseCell: UICollectionViewCell {
    
    //MARK: UI OBJECTS
    lazy var recipeImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var servingsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var timePrepLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    //MARK: PRIVATE FUNCTIONS
    private func addCellViews(){
        addSubview(recipeImage)
        addSubview(servingsLabel)
        addSubview(timePrepLabel)
    }
    private func setUpCellViews(){
        setUpRecipeStackView()
    }
    
    private func setUpRecipeStackView(){
        let stackView = UIStackView(arrangedSubviews: [recipeImage,servingsLabel,timePrepLabel])
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
    
}
