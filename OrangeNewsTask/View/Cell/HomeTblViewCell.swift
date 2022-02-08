//
//  HomeTblViewCell.swift
//  OrangeNewsTask
//
//  Created by maika on 08/02/2022.
//

import UIKit

class HomeTblViewCell: UITableViewCell {

    @IBOutlet weak var newsTitleLbl: UILabel!
    @IBOutlet weak var newsDescriptionLbl: UILabel!
    @IBOutlet weak var newsDateLbl: UILabel!
    @IBOutlet weak var newsSourceLbl: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
