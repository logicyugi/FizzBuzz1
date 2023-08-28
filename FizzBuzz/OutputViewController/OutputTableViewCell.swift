//
//  OutputTableViewCell.swift
//  FizzBuzz
//
//  Created by Antoine El Samra on 26/08/2023.
//

import UIKit


class OutputTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var outputLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
