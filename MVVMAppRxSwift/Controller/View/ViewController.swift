//
//  ViewController.swift
//  MVVMAppRxSwift
//
//  Created by Shaxzod Azamatjonov on 26/07/22.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    private var viewModel = ViewModel()
    private var bag = DisposeBag()
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ViewCell.self, forCellReuseIdentifier: ViewCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        bindTableView()
    }
}


extension ViewController: UITableViewDelegate {
    private func initViews(){
        view.backgroundColor = .white
        view.addSubview(tableView)
        viewModel.reloadTableView = { [unowned self] in
            self.tableView.reloadData()
        }
    }
    private func bindTableView() {
        tableView.rx.setDelegate(self).disposed(by: bag)
        viewModel.users.bind(to: tableView.rx.items(cellIdentifier: ViewCell.reuseIdentifier, cellType: ViewCell.self)){ (row,item,cell) in
            cell.updateUI(with: self.viewModel.getUser(i: row))
            
        }.disposed(by: bag )
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
}
