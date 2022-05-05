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
        
        //Binding ViewController with ViewModel
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
                self?.lblRole.text = user?.type
                self?.lblBlog.text = user?.blog
            }
        }
    }
    @IBAction func btnOnClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
