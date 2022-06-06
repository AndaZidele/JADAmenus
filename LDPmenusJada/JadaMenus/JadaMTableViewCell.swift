//
//  JadaMTableViewCell.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 08/04/2022.
//

import UIKit

class JadaMTableViewCell: UITableViewCell {

    @IBOutlet weak var katNos: UILabel!
    @IBOutlet weak var katImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
