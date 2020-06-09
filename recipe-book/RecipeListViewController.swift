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
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        /*
        if let path = Bundle.main.path(forResource: "test", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                  if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["person"] as? [Any] {
                            // do stuff
                  }
              } catch {
                   // handle error
              }
        }
        */
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
        
        return cell
    }
    
}

extension RecipeListViewController: UITableViewDelegate {
    
}
