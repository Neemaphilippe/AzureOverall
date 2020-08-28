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
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .clear
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
    
    private func loadCart(){
        do {
            recipeCart = try CartPersistenceHelper.manager.getRecipe()
            
        }catch{
            print("Oops problem loading cart!")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        view.backgroundColor = #colorLiteral(red: 0.900858283, green: 0.900858283, blue: 0.900858283, alpha: 1)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCart()
    }
    
    
}
extension CartScreenVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeCart.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = cartTableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as? CartCell else {return UITableViewCell()}
        let currentItem = recipeCart[indexPath.row]
        cell.cartRecipeTitle.text = currentItem.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailScreenVC = DetailScreenVC()
        detailScreenVC.detailRecipe = recipeCart[indexPath.row]
    }


}
