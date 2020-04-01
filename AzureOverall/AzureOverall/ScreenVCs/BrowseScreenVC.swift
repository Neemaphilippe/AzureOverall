//
//  BrowseScreenVC.swift
//  AzureOverall
//
//  Created by Pursuit on 3/28/20.
//  Copyright © 2020 Neema Philippe. All rights reserved.
//

import UIKit

class BrowseScreenVC: UIViewController {
    
    private var searchWord: String? {
        didSet{
            browseCollectionView.reloadData()
        }
    }
    
    private var recipes = [RecipeResult]() {
        didSet{
            DispatchQueue.main.async {
                self.browseCollectionView.reloadData()
            }
        }
    }
    
    //MARK: UI OBJECTS
    lazy var pursuitFarmsLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Pursuit Farms!"
        label.numberOfLines = 0
        label.font = UIFont(name: "Times New Roman", size: 30)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    lazy var browseSearchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Browse items here"
        sb.delegate = self
        sb.isTranslucent = false
        sb.searchBarStyle = .minimal
        return sb
    }()
    
    lazy var browseCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.register(BrowseCell.self, forCellWithReuseIdentifier: "browseCell")
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    
    //MARK: PRIVATE FUNCTIONS
    private func addViews(){
        view.addSubview(browseSearchBar)
        view.addSubview(pursuitFarmsLabel)
        view.addSubview(browseCollectionView)
    }
    private func setUpViews(){
        setUpSearchBar()
        setUpWelcomeLabel()
        setUpCollectionView()
    }
    
    private func setUpWelcomeLabel(){
        pursuitFarmsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pursuitFarmsLabel.topAnchor.constraint(equalTo: browseSearchBar.bottomAnchor, constant: 40),
            pursuitFarmsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    private func setUpSearchBar(){
        browseSearchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            browseSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            browseSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            browseSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            browseSearchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setUpCollectionView(){
        browseCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            browseCollectionView.topAnchor.constraint(equalTo: pursuitFarmsLabel.bottomAnchor, constant: 50),
            browseCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            browseCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            browseCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
            
        ])
    }
    
    private func loadData(){
        RecipeApiHelper.manager.getRecipe(recipe: searchWord ?? "") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let recipe):
                    self.recipes = recipe
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setUpViews()
        loadData()
//        print(recipes.count)
        view.backgroundColor = #colorLiteral(red: 0.900858283, green: 0.900858283, blue: 0.900858283, alpha: 1)
    }
    
    
}

extension BrowseScreenVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "browseCell", for: indexPath) as? BrowseCell else {return UICollectionViewCell()}
        let currentRecipe = recipes[indexPath.row]
        cell.recipeTitle.text = currentRecipe.title
        cell.servingsLabel.text = ("Servings:\(currentRecipe.servings)")
        cell.timePrepLabel.text = ("Prep time:\( currentRecipe.readyInMinutes)")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailScreenVC()
        let selectedRecipe = recipes[indexPath.row]
        detailVC.detailRecipe = selectedRecipe
        
        
    }

}
extension BrowseScreenVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchWord = searchBar.text?.lowercased()
        loadData()
        searchBar.resignFirstResponder()
    }
}
