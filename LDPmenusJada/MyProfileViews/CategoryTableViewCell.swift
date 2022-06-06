//
//  CategoryTableViewCell.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 03/03/2022.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categorylabel: UILabel!
    @IBOutlet weak var categoryImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
