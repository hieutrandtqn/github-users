//
//  UserViewModel.swift
//  GithubUsers
//
//  Created by Tran Trong Hieu on 5/5/22.
//  Copyright © 2022 Example. All rights reserved.
//

import Foundation

class UserViewModel: NSObject {
    
    private var api: APIService!
    var users: Observable<[UserModel]> = Observable([])
    
    override init() {
        api = APIService()
    }
    func getUserData(page: Int) {
        api.getUsers(pageIndex: page) { [weak self] result in
            self?.users.value = result
        }
    }
}
