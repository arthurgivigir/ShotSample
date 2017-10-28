//
//  ShotTableViewCell.swift
//  Shot Sample iOS
//
//  Created by Arthur Givigir on 28/10/17.
//  Copyright © 2017 Arthur Givigir. All rights reserved.
//

import UIKit

class ShotTableViewCell: UITableViewCell {

    @IBOutlet weak var shotImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var viewsCount: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
