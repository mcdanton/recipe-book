//
//  RecipeListTableViewCell.swift
//  recipe-book
//
//  Created by Dan Hefter on 6/9/20.
//  Copyright © 2020 Dan Hefter. All rights reserved.
//

import UIKit

class RecipeListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!

    @IBOutlet weak var recipeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
