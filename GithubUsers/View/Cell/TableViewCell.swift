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
        imgAvatar.layer.masksToBounds = false
        imgAvatar.layer.cornerRadius = imgAvatar.frame.height/2
        imgAvatar.clipsToBounds = true
    }

    func updateRoleFrame() {
        //Add left & right margin
        lblRole.text = "   " + lblRole.text! + "   "
        
        //Update new size to fit text content
        let newSize = lblRole.intrinsicContentSize.width
        lblRole.frame.size.width = newSize
        
        //Set background and corner radius
        lblRole.textColor = UIColor.white
        lblRole.backgroundColor = UIColor(red: 0.66, green: 0.40, blue: 0.79, alpha: 1.00)
        lblRole.layer.masksToBounds = false
        lblRole.layer.cornerRadius = lblRole.frame.height/2
        lblRole.clipsToBounds = true
    }
}
