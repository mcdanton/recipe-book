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
    
    var viewModel = RecipeListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.navigationItem.title = "Recipes"

        viewModel.fetchRecipes {
            recipeListTableView.reloadData()
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
        return viewModel.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeListTableViewCell", for: indexPath) as! RecipeListTableViewCell
        
        cell.recipeNameLabel.text = viewModel.recipes[indexPath.row].name
        if let imageUrl = viewModel.recipes[indexPath.row].imageUrl {
            cell.recipeImageView.image = UIImage(named: imageUrl)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let addRecipeVC = storyboard?.instantiateViewController(identifier: "AddRecipeViewController", creator: { [unowned self] coder in
            return AddRecipeViewController(coder: coder, viewModel: self.viewModel.addRecipeViewModel(indexPath: indexPath))
        }) else {
            fatalError("Failed to load AddRecipeViewController.")
        }

        navigationController?.pushViewController(addRecipeVC, animated: true)
        
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//
//        let addRecipeVC = storyBoard.instantiateViewController(withIdentifier: "AddRecipeViewController") as! AddRecipeViewController
//
//        addRecipeVC.recipe = viewModel.recipes[indexPath.row]
//
//        self.navigationController?.pushViewController(addRecipeVC, animated: true)
        
        
    }
    
}

extension RecipeListViewController: UITableViewDelegate {
    
    
}
