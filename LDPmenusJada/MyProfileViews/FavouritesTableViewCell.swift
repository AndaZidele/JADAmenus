//
//  FavouritesTableViewCell.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 09/04/2022.
//

import UIKit

class FavouritesTableViewCell: UITableViewCell {

    @IBOutlet weak var favlab: UILabel!
    @IBOutlet weak var favimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
