//
//  TableViewCell.swift
//  Instagram
//
//  Created by Devansh Sharma on 08/06/17.
//  Copyright © 2017 Devansh Sharma. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

       
    @IBOutlet weak var myimage: UIImageView!
    
    @IBOutlet weak var posttext: UILabel!
    
    override func awakeFromNib() {
    
    
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
