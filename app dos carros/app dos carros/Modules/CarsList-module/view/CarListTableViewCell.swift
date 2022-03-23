//
//  CarListTableViewCell.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 08/03/22.
//

import UIKit

class CarListTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var carImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 15
        backView.layer.borderColor = .init(red: 220, green: 220, blue: 220, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
