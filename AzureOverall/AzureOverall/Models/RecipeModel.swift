//
//  RecipeModel.swift
//  AzureOverall
//
//  Created by Pursuit on 3/30/20.
//  Copyright © 2020 Neema Philippe. All rights reserved.
//

import Foundation

// MARK: - Recipe

struct AllRecipeInfo: Codable {
    let results: [RecipeResult]
    
    static func getRecipes(from jsonData: Data) throws -> [RecipeResult]? {
        do {
            let response = try JSONDecoder().decode(AllRecipeInfo.self, from: jsonData)
            return response.results
        } catch {
            print(error)
            return []
        }
    }
    
}

// MARK: - Result
struct RecipeResult: Codable {
    let id: Int?
    let title: String?
    let readyInMinutes, servings: Int?
    let image: String? 
    let imageUrls: [String]?
}
