//
//  CellData.swift
//  TNation Zadatak
//
//  Created by Mac on 4/2/19.
//  Copyright © 2019 crossover. All rights reserved.
//

import UIKit

class CellData: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var naziv: UILabel!
    @IBAction func edit(_ sender: UIButton) {
    }
    

    @IBOutlet weak var adresa: UILabel!
    
    
    
}
