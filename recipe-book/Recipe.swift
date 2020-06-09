//
//  Recipe.swift
//  recipe-book
//
//  Created by Dan Hefter on 6/9/20.
//  Copyright © 2020 Dan Hefter. All rights reserved.
//

import Foundation

class Recipes : Codable {
    
    let recipes: [Recipe]
    
    init(recipes: [Recipe]) {
        self.recipes = recipes
    }
    
}



class Recipe : Codable {
    
    var id: String
    var name: String
    var imageUrl: String?
    var reviewCount: Int
    var cookTime: String?
    var servings: String?
    
    
    init(id: String, name: String, imageUrl: String?, reviewCount: Int, cookTime: String?, servings: String?) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.reviewCount = reviewCount
        self.cookTime = cookTime
        self.servings = servings
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl = "image_url"
        case reviewCount = "review_count"
        case cookTime = "cook_time"
        case servings
    }
    
}
