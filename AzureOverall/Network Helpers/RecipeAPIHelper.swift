//
//  RecipeAPIHelper.swift
//  AzureOverall
//
//  Created by Pursuit on 3/30/20.
//  Copyright © 2020 Neema Philippe. All rights reserved.
//

import Foundation

struct RecipeApiHelper {
   
    private init() {}
    static let manager = RecipeApiHelper()
    
    func getRecipe(city: String, completionHandler: @escaping (Result<[Recipe], AppError>) -> () ) {
        
        let urlStr = "https://api.spoonacular.com/recipes/search?&apiKey=9ae5c317607b41b5a2af35a19f1402f1"
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(AppError.badURL))
            return
        }

        NetworkManager.manager.performDataTask(withUrl: url, httpMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
                return
            case .success(let data):
                do {
                    let recipes = try AllRecipeInfo.getRecipes(from: data)
                    completionHandler(.success(recipes ?? []))
                }catch{
                    completionHandler(.failure(.invalidJSONResponse))
                }
                
                
            }
        }
        
    }
    
}
