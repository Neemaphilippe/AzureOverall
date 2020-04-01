//
//  CartScreenVC.swift
//  AzureOverall
//
//  Created by Pursuit on 3/28/20.
//  Copyright © 2020 Neema Philippe. All rights reserved.
//

import UIKit

class CartScreenVC: UIViewController {
    
    var recipeCart = [RecipeResult](){
        didSet{
            cartTableView.reloadData()
        }
    }
    
    //MARK: UI OBJECTS
    lazy var cartTableView: UITableView = {
        let tv = UITableView()
        tv.register(CartCell.self, forCellReuseIdentifier: "cartCell")
        return tv
    }()
    
    
    //MARK: PRIVATE FUNCTIONS
    private func setUpView(){
        view.addSubview(cartTableView)
        constrainTableView()
    }
    
    private func constrainTableView(){
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cartTableView.topAnchor.constraint(equalTo: view.topAnchor),
            cartTableView.heightAnchor.constraint(equalTo: view.heightAnchor),
            cartTableView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        view.backgroundColor = #colorLiteral(red: 0.900858283, green: 0.900858283, blue: 0.900858283, alpha: 1)

    }
    
    
    
}
//extension CartScreenVC: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//}
