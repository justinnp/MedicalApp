//
//  PatientCell.swift
//  MedicalApp
//
//  Created by Justin  Powell on 11/27/18.
//  Copyright © 2018 Justin  Powell. All rights reserved.
//

import UIKit

class PatientCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
