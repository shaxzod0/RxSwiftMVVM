//
//  ViewModel.swift
//  MVVMAppRxSwift
//
//  Created by Shaxzod Azamatjonov on 26/07/22.
//

import UIKit
import RxSwift
import RxCocoa

class ViewModel {
    var users = BehaviorSubject(value: [UserModel]())
    private var items: [UserModel] = [] {
        didSet {
            self.reloadTableView?()
        }
    }
    init() {
        getUsers()
    }
    func getUser(i: Int) -> UserModel{
        let userId = items[i].userId
        let id = items[i].Id
        let title = items[i].title
        let body = items[i].body
        return UserModel(userId: userId, Id: id, title: title, body: body)
    }
    func getUsersCount()-> Int {
        return items.count
    }
    func getUsers() {
        AppRepository.shared.getUsers { res in
            self.users.on(.next(res))
            self.items = res
        }
    }

    var reloadTableView: (()->())?
}
