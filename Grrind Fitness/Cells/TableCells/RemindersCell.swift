//
//  RemindersCell.swift
//  Grrind Fitness
//
//  Created by user on 27/04/20.
//  Copyright © 2020 aulakh. All rights reserved.
//

import UIKit

class RemindersCell: UITableViewCell {

    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var repeatDay: UILabel!
    @IBOutlet weak var reminderName: UILabel!
    @IBOutlet weak var ampm: UILabel!
    @IBOutlet weak var time: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
