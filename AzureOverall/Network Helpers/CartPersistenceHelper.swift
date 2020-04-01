//
//  CartPersistenceHelper.swift
//  AzureOverall
//
//  Created by Pursuit on 3/31/20.
//  Copyright © 2020 Neema Philippe. All rights reserved.
//

import Foundation

struct CartPersistenceHelper {
    
    private init() {}
    
    static let manager = CartPersistenceHelper()

     private let persistenceHelper = PersistenceHelper<RecipeResult>(fileName: "cart.plist")

    func saveRecipe(recipe: RecipeResult) throws {
        try persistenceHelper.save(newElement: recipe)
    }

    func getRecipe() throws -> [RecipeResult] {
        return try persistenceHelper.getObjects()
    }

    func deleteRecipe(withMessage: String) throws {
        do {
            let entries = try getRecipe()
            let newEntries = entries.filter { $0.title != withMessage}
            try persistenceHelper.replace(elements: newEntries)
        }
    }

}
