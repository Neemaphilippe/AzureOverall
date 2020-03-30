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
    let recipe: [Recipe]
    
    static func getRecipes(from jsonData: Data) throws -> [Recipe]? {
        do {
            let response = try JSONDecoder().decode(AllRecipeInfo.self, from: jsonData)
            return response.recipe
        } catch {
            print(error)
            return []
        }
    }
}

struct Recipe: Codable {
    let results: [RecipeResult]
    let baseURI: String
    let offset, number, totalResults, processingTimeMS: Int
    let expires: Int
    let isStale: Bool

    enum CodingKeys: String, CodingKey {
        case results
        case baseURI = "baseUri"
        case offset, number, totalResults
        case processingTimeMS = "processingTimeMs"
        case expires, isStale
    }
}

// MARK: - Result
struct RecipeResult: Codable {
    let id: Int
    let title: String
    let readyInMinutes, servings: Int
    let image: String
    let imageUrls: [String]
}
