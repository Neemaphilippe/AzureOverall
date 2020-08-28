//
//  BrowseScreenVC.swift
//  AzureOverall
//
//  Created by Pursuit on 3/28/20.
//  Copyright © 2020 Neema Philippe. All rights reserved.
//

import UIKit
import Kingfisher


class BrowseScreenVC: UIViewController {
    
    
    
    private var searchWord: String? = nil {
        didSet{
            loadData()
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
        label.text = "WELCOME TO PURSUIT FARMS!"
        label.numberOfLines = 0
        label.font = UIFont(name: "Times New Roman", size: 30)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    lazy var browseSearchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.delegate = self
        sb.searchBarStyle = .minimal
        sb.placeholder = "Browse recipes here"
        sb.searchTextField.font = UIFont(name: "Times New Roman", size: 20)
        return sb
    }()
    
    lazy var browseCollectionView: UICollectionView = {
        let cv: UICollectionView =  UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        cv.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        cv.register(BrowseCell.self, forCellWithReuseIdentifier: "browseCell")
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    
    //MARK: PRIVATE FUNCTIONS
    private func addViews(){
        view.addSubview(browseSearchBar)
        view.addSubview(browseCollectionView)
        view.addSubview(pursuitFarmsLabel)
    }
    private func setUpViews(){
        setUpSearchBar()
        setUpCollectionView()
        setUpWelcomeLabel()
       
    }
    
    
    private func setUpWelcomeLabel(){
        pursuitFarmsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pursuitFarmsLabel.topAnchor.constraint(equalTo: browseSearchBar.bottomAnchor, constant: 50),
            pursuitFarmsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pursuitFarmsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//            pursuitFarmsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            pursuitFarmsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//            pursuitFarmsLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
            
        ])
    }
    
    private func setUpSearchBar(){
        browseSearchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            browseSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            browseSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            browseSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            browseSearchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    
    private func setUpCollectionView(){
        browseCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            browseCollectionView.topAnchor.constraint(equalTo: pursuitFarmsLabel.bottomAnchor, constant: 10),
            browseCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            browseCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            browseCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

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
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
      loadData()
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
       
        cell.recipeImage.kf.indicatorType = .activity
        
        if let image = currentRecipe.image {
            let imageURl = URL(string: image)
            cell.recipeImage.kf.setImage(with: imageURl)
            
        }else {
            cell.recipeImage.image = UIImage(named: "noimage")
        }
        
        
//        ImageManager.manager.getImage(urlStr: "https://spoonacular.com/recipeImages/\(currentRecipe.imageUrls?[0])") { (result) in
//          DispatchQueue.main.async {
//            switch result{
//            case .failure(let error):
//              print(error)
//            case .success(let data):
//              cell.recipeImage.image = data
//            }
//          }
//        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailScreenVC()
        let selectedRecipe = recipes[indexPath.row]
        detailVC.detailRecipe = selectedRecipe
        
        
    }

}
extension BrowseScreenVC: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchWord = searchBar.text?.lowercased()
        searchBar.resignFirstResponder()
    }
}
