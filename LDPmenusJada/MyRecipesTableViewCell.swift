//
//  MyRecipesTableViewCell.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 25/02/2022.
//

import UIKit

class MyRecipesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var myRecLab: UILabel!
    @IBOutlet weak var myRecImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
