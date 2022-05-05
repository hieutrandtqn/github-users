//
//  Services.swift
//  GithubUsers
//
//  Created by Tran Trong Hieu on 5/5/22.
//  Copyright © 2022 Example. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    let URL_GET_USERS = "https://api.github.com/users"
    
    func getUsers(pageIndex: Int, completion:  @escaping ([UserModel]) -> ()) {
        Alamofire.request(URL_GET_USERS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: [:]).responseJSON {
            response in
            switch (response.result) {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    let users = try decoder.decode([UserModel].self, from: response.data!)
                    completion(users)
                }catch let error {
                    print("Parse object error %@", error)
                }
                break
            case .failure:
                print(Error.self)
            }
        }
    }
    
    func getUserDetail(name: String, completion:  @escaping (DetailModel) -> ()) {
        Alamofire.request(URL_GET_USERS + "/" + name, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: [:]).responseJSON {
            response in
            switch (response.result) {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(DetailModel.self, from: response.data!)
                    completion(user)
                }catch let error {
                    print("Parse object error %@", error)
                }
                break
            case .failure:
                print(Error.self)
            }
        }
    }
}
