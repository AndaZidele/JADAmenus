//
//  ClassTableViewCell.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 03/03/2022.
//

import UIKit

class ClassTableViewCell: UITableViewCell {
    @IBOutlet weak var klaseLabel: UILabel!
    @IBOutlet weak var bilditelab: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
