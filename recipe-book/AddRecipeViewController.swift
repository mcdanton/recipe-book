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
    
    let viewModel: AddRecipeViewModel
    
    init?(coder: NSCoder, viewModel: AddRecipeViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    init(viewModel: AddRecipeViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = viewModel.recipe.name
        
        setupViews()

    }
    
    
    func setupViews() {
        if let imageUrl = viewModel.recipe.imageUrl {
            recipeImageView.image = UIImage(named: imageUrl)
        }
        recipeNameLabel.text = viewModel.recipe.name
        recipeCookTimeLabel.text = viewModel.recipe.cookTime
        
        recipeEditImageButton.addTarget(self, action: #selector(editRecipeImage), for: .touchUpInside)
    }
    
    @objc
    func editRecipeImage() {
        //TODO: Add Handler for edit image button
        print("Edit Recipe Tapped")
    }

}
