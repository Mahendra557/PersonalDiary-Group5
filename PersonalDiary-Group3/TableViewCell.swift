//
//  TableViewCell.swift
//  PersonalDiary-Group3
//
//  Created by Konda,Soumya on 4/25/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var titleCellOL: UILabel!
    
    @IBOutlet weak var descCellOL: UILabel!
    
    @IBOutlet weak var dateCellOL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
