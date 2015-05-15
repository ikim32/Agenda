//
//  AgendaTableViewCell.swift
//  Agenda2
//
//  Created by MIguel Saravia on 5/11/15.
//  Copyright (c) 2015 MIguel Saravia. All rights reserved.
//

import UIKit
import Parse

class AgendaTableViewCell: UITableViewCell {

    @IBOutlet weak var NameCell: UILabel!
    @IBOutlet weak var CreatAtLabel: UILabel!
    @IBOutlet weak var PhoneLabelCell: UILabel!
    @IBOutlet weak var EmailLabelCell: UILabel!
    @IBOutlet weak var LastNameLabelCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
