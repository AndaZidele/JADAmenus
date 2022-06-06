//
//  CoursesTableViewCell.swift
//  LDPmenusJada
//
//  Created by Arta Zidele on 02/03/2022.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {

    @IBOutlet weak var klasImg: UIImageView!
    @IBOutlet weak var klasNos: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
