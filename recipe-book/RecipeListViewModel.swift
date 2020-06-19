//
//  RecipeListViewModel.swift
//  recipe-book
//
//  Created by Dan Hefter on 6/19/20.
//  Copyright © 2020 Dan Hefter. All rights reserved.
//

import Foundation

class RecipeListViewModel {
    
    var recipes = [Recipe]()

    func addRecipeViewModel(indexPath: IndexPath) -> AddRecipeViewModel {
        return AddRecipeViewModel(recipe: recipes[indexPath.row])
    }
    
    func fetchRecipes(completion: () -> ()) {
        if let url = Bundle.main.url(forResource: "recipes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let recipeList = try decoder.decode(Recipes.self, from: data)
                
                recipes = recipeList.recipes
                completion()
                
            } catch {
                print("Error")
            }
            
        }
    }
    
}
