//
//  AppRepository.swift
//  MVVMAppRxSwift
//
//  Created by Shaxzod Azamatjonov on 26/07/22.
//

import UIKit
import Alamofire

class AppRepository {
    static let shared = AppRepository()
    
    func getUsers(compilationHandler: @escaping (([UserModel])-> Void)) {
        let url = AppUrl()
        AF.request(url.base_url).responseDecodable(of: [UserModel].self){ res in
            guard let data = res.value else { return }
            compilationHandler(data)
        }
    }
}
