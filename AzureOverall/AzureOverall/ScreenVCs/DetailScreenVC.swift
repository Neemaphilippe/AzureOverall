//
//  DetailScreenVC.swift
//  AzureOverall
//
//  Created by Pursuit on 3/28/20.
//  Copyright © 2020 Neema Philippe. All rights reserved.
//

import UIKit

class DetailScreenVC: UIViewController {

    var detailRecipe: RecipeResult!
    
    //MARK: UI OBJECTS
    
    let detailRecipeTitle: UILabel = {
        let label = UILabel()
        label.text = "Recipe Title"
        label.numberOfLines = 0
        label.font = UIFont(name: "Times New Roman", size: 25)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let detailRecipeImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let itemCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.numberOfLines = 0
        label.font = UIFont(name: "Times New Roman", size: 15)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0.0
        stepper.stepValue = 1.0
        stepper.maximumValue = 10
        stepper.addTarget(self, action: #selector(increaseStepper), for: .touchUpInside)
        stepper.tintColor = .darkGray
        return stepper
    }()
    
//    let addToCartButton: UIButton = {
//        
//    }()
    
    
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
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        
        ])
        
    }
    
    
    @objc func increaseStepper(){
        itemCountLabel.text = "\(Int(stepper.value))"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addDetailViews()
        setUpDetailStackView()
        view.backgroundColor = #colorLiteral(red: 0.900858283, green: 0.900858283, blue: 0.900858283, alpha: 1)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        
//    }
    
}
