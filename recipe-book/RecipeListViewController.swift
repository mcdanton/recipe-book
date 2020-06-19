//
//  RecipeListViewController.swift
//  recipe-book
//
//  Created by Dan Hefter on 6/9/20.
//  Copyright © 2020 Dan Hefter. All rights reserved.
//

import UIKit

class RecipeListViewController: UIViewController {
    
    @IBOutlet weak var recipeListTableView: UITableView!
    
    var recipes = [Recipe]()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.navigationItem.title = "Recipes"

        if let url = Bundle.main.url(forResource: "recipes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let recipeList = try decoder.decode(Recipes.self, from: data)
                
                self.recipes = recipeList.recipes
                recipeListTableView.reloadData()
                
            } catch {
                print("Error")
            }
            
        }
        
        recipeListTableView.dataSource = self
        recipeListTableView.delegate = self
        
    }

}

extension RecipeListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeListTableViewCell", for: indexPath) as! RecipeListTableViewCell
        
        cell.recipeNameLabel.text = recipes[indexPath.row].name
        if let imageUrl = recipes[indexPath.row].imageUrl {
            cell.recipeImageView.image = UIImage(named: imageUrl)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let addRecipeVC = storyBoard.instantiateViewController(withIdentifier: "AddRecipeViewController") as! AddRecipeViewController

        addRecipeVC.recipe = recipes[indexPath.row]
        
        self.navigationController?.pushViewController(addRecipeVC, animated: true)
        
        
    }
    
}

extension RecipeListViewController: UITableViewDelegate {
    
    
}
