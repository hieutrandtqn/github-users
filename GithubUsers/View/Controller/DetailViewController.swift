//
//  UserDetailViewController.swift
//  GithubUsers
//
//  Created by Tran Trong Hieu on 5/5/22.
//  Copyright © 2022 Example. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgAvatar: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBio: UILabel!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var lblRole: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblBlog: UILabel!
    
    var userName: String!
    private var viewModel: DetailViewModel!
    
    
    override func viewDidLoad() {
        
        //Set avatar in circle
        imgAvatar.layer.borderWidth = 1
        imgAvatar.layer.masksToBounds = false
        imgAvatar.layer.borderColor = UIColor.black.cgColor
        imgAvatar.layer.cornerRadius = imgAvatar.frame.height/2
        imgAvatar.clipsToBounds = true
        
        viewModel = DetailViewModel()
        viewModel.getUserDetail(userName: userName)
        
        //Binding with view model
        viewModel.user.bind { [weak self] user in
            if user != nil {
                self?.imgAvatar.load.request(with: user!.avatar_url!, onCompletion: { (image, error, operation) in
                    if (error == nil) {
                        DispatchQueue.main.async {
                            self?.imgAvatar.image = image
                        }
                    }
                })
                self?.lblName.text = user?.name
                self?.lblBio.text = user?.bio
                self?.lblLogin.text = user?.login
                self?.lblLocation.text = user?.location
                self?.lblBlog.text = user?.blog
                self?.lblRole.text = user?.type
                self?.updateRoleFrame()
            }
        }
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
    
    @IBAction func btnOnClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
