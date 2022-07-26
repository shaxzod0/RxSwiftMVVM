//
//  ViewCell.swift
//  MVVMAppRxSwift
//
//  Created by Shaxzod Azamatjonov on 26/07/22.
//

import UIKit
import SnapKit

class ViewCell: BaseTableCell <UserModel> {
    var title = UILabel()
    
    override func initView() {
        self.addSubview(title)
        title.numberOfLines = 0
        title.font = .systemFont(ofSize: 18, weight: .bold)
        title.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
        }
    }
    override func updateUI(with model: UserModel) {
        title.text = model.title
    }
}
