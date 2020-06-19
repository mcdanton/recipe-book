//
//  AddRecipeViewController.swift
//  recipe-book
//
//  Created by Dan Hefter on 6/10/20.
//  Copyright © 2020 Dan Hefter. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController {
    
    @IBOutlet weak var recipeEditImageButton: UIButton!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UITextField!
    @IBOutlet weak var recipeCookTimeLabel: UITextField!
    @IBOutlet weak var recipeIngredientsTextView: UITextView!
    @IBOutlet weak var recipeInstructionsTextView: UITextView!
    
    lazy var recipe: Recipe? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeNameLabel.text = recipe?.name
    }
    

}
