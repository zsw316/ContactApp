//
//  ContactListViewCell.swift
//  ContactListApp
//
//  Created by Ashley Han on 4/8/2017.
//  Copyright © 2017 simpletask. All rights reserved.
//

import UIKit

class ContactListViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

// Mark: - Configure cell
extension ContactListViewCell {
    func configureWithContactEntity(entity: ContactEntity) {
        
        nameLabel.text = entity.name
        emailLabel.text = entity.email
        customImageView.sd_setImage(with: URL.init(string: "https://unsplash.it/50/?random"));
    }
}
