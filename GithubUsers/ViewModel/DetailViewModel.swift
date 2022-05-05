//
//  DetailViewModel.swift
//  GithubUsers
//
//  Created by Tran Trong Hieu on 5/5/22.
//  Copyright © 2022 Example. All rights reserved.
//

import Foundation

class DetailViewModel: NSObject {
    
    private var api: APIService!
    var user: Observable<DetailModel> = Observable(nil)
    
    override init() {
        api = APIService()
    }
    func getUserDetail(userName: String) {
        api.getUserDetail(name: userName) { [weak self] result in
            self?.user.value = result
        }
    }
}
