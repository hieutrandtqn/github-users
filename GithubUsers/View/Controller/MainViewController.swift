//
//  MainViewController.swift
//  GithubUsers
//
//  Created by Tran Trong Hieu on 5/5/22.
//  Copyright © 2022 Example. All rights reserved.
//

import UIKit
import ImageLoader

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: UserViewModel!
    
    let CELL_HEIGHT: CGFloat = 75
    var userData: Array<UserModel>
    
    init() {
        userData = Array<UserModel>()
        super.init(nibName: "MainViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel = UserViewModel()
        viewModel.getUserData(since: 0)
        //Binding with view model
        viewModel.users.bind { [weak self] user in
            self?.userData.append(contentsOf:user!)
            self?.tableView.reloadData()
        }
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CELL_HEIGHT
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: TableViewCell! = tableView.dequeueReusableCell(withIdentifier: "TableCell") as? TableViewCell
        if (cell == nil) {
            tableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableCell")
            cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as? TableViewCell
        }
        
        //Update data to UI
        cell.lblUsername.text = userData[indexPath.row].login
        cell.lblRole.text = userData[indexPath.row].type
        cell.updateRoleFrame()
        cell.imgAvatar.load.request(with: userData[indexPath.row].avatar_url!, onCompletion: { (image, error, operation) in
            if (error == nil) {
                DispatchQueue.main.async {
                    cell.imgAvatar.image = image
                }
            }
        })
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.userName = userData[indexPath.row].login
        self.navigationController?.present(detailVC, animated: true)
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == userData.count - 1) {
            let since = userData.last!.id!
            viewModel.getUserData(since: since)
        }
    }
}
