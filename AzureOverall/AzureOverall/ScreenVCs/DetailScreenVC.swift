//
//  DetailScreenVC.swift
//  AzureOverall
//
//  Created by Pursuit on 3/28/20.
//  Copyright © 2020 Neema Philippe. All rights reserved.
//

import UIKit

class DetailScreenVC: UIViewController {

    //MARK: UI OBJECTS
    
    let detailRecipeTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Times New Roman", size: 25)
        return label
    }()
    
    let detailRecipeImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let itemCountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Times New Roman", size: 15)
        return label
    }()
    
    let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0.0
        stepper.maximumValue = 100
        stepper.tintColor = .darkGray
        return stepper
    }()
    
    
    //MARK: PRIVATE FUNCTIONS
    private func addDetailViews(){
        view.addSubview(detailRecipeTitle)
        view.addSubview(detailRecipeImage)
        view.addSubview(itemCountLabel)
        view.addSubview(stepper)
    }
    
    private func setUpDetailStackView(){
        let stackView = UIStackView(arrangedSubviews: [detailRecipeTitle, detailRecipeImage, itemCountLabel, stepper])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDetailViews()
        setUpDetailStackView()
        view.backgroundColor = #colorLiteral(red: 0.900858283, green: 0.900858283, blue: 0.900858283, alpha: 1)
    }
    
}
