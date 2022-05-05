//
//  TableViewCell.swift
//  GithubUsers
//
//  Created by Tran Trong Hieu on 5/5/22.
//  Copyright © 2022 Example. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblRole: UILabel!
    
    override func draw(_ rect: CGRect) {
        //Set avatar in circle
        imgAvatar.layer.borderWidth = 1
        imgAvatar.layer.masksToBounds = false
        imgAvatar.layer.borderColor = UIColor.black.cgColor
        imgAvatar.layer.cornerRadius = imgAvatar.frame.height/2
        imgAvatar.clipsToBounds = true
    }

}
