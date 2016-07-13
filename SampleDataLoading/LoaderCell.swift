//
//  LoaderCell.swift
//  SampleDataLoading
//
//  Created by Sanchit Kumar Singh on 7/13/16.
//  Copyright © 2016 Sanchit Kumar Singh. All rights reserved.
//

import UIKit

class LoaderCell: UITableViewCell {

    @IBOutlet weak var loader: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
