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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeListTableView.dataSource = self
        recipeListTableView.delegate = self
        
    }

}

extension RecipeListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeListTableViewCell", for: indexPath) as! RecipeListTableViewCell
        
        return cell
    }
    
}

extension RecipeListViewController: UITableViewDelegate {
    
}
