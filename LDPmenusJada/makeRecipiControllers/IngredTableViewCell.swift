//
//  IngredTableViewCell.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 10/04/2022.
//

import UIKit

class IngredTableViewCell: UITableViewCell {

    @IBOutlet weak var ingDoneBtn: UIButton!
    @IBOutlet weak var ingNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
