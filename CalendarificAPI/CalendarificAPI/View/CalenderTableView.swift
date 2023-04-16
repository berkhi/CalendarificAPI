//
//  CalenderTableViewCell.swift
//  CalendarificAPI
//
//  Created by BerkH on 11.04.2023.
//

import UIKit

class CalenderTableView: UITableViewCell {

    @IBOutlet var lblHolidayName: UILabel!
    @IBOutlet var lblHolidayDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
