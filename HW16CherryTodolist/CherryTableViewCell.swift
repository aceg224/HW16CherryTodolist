//
//  CherryTableViewCell.swift
//  HW16CherryTodolist
//
//  Created by min-chia on 2019/3/2.
//  Copyright © 2019 min-chia. All rights reserved.
//

import UIKit

class CherryTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
