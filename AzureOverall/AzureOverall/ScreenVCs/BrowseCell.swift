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
    lazy var recipeTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black 
        label.textAlignment = .center
        return label
    }()
    
    lazy var recipeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
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
    
    override init(frame: CGRect) {
      super.init(frame: frame)
       addCellViews()
//        setUpRecipeTitle()
        setUpRecipeImage()
    }
     
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: PRIVATE FUNCTIONS
    private func addCellViews(){
        addSubview(recipeTitle)
        addSubview(recipeImage)
        addSubview(servingsLabel)
        addSubview(timePrepLabel)
    }
    
    private func setUpRecipeImage(){
        recipeImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recipeImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            recipeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recipeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recipeImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        
    }
    
    private func setUpRecipeTitle(){
        recipeTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recipeTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            recipeTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recipeTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        
        ])
    }
    
}
