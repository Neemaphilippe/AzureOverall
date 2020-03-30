//
//  BrowseScreenVC.swift
//  AzureOverall
//
//  Created by Pursuit on 3/28/20.
//  Copyright © 2020 Neema Philippe. All rights reserved.
//

import UIKit

class BrowseScreenVC: UIViewController {

    //MARK: UI OBJECTS
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
        cv.backgroundColor = .lightGray
        cv.register(BrowseCell.self, forCellWithReuseIdentifier: "browseCell")
//        cv.dataSource = self
//        cv.delegate = self
        return cv
    }()
        
    
    //MARK: PRIVATE FUNCTIONS
    private func addViews(){
        view.addSubview(browseSearchBar)
        view.addSubview(browseCollectionView)
    }
    private func setUpViews(){
        setUpSearchBar()
        setUpCollectionView()
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
            browseCollectionView.topAnchor.constraint(equalTo: browseSearchBar.bottomAnchor, constant: 100),
            browseCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            browseCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
        browseCollectionView.heightAnchor.constraint(equalToConstant: 300)
            
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setUpViews()
        view.backgroundColor = #colorLiteral(red: 0.900858283, green: 0.900858283, blue: 0.900858283, alpha: 1)
    }
    

}
extension BrowseScreenVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }
}
//extension BrowseScreenVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//}
