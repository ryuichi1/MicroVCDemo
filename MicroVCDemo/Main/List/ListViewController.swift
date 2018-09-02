//
//  ListViewController.swift
//  MicroVCDemo
//
//  Created by 相田 隆一 on 2018/09/02.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit
import Mew
import RxCocoa
import RxSwift
import DataModel

class ListViewController: UIViewController, Instantiatable, Injectable {
    typealias Environment = EnvironmentMock
    typealias Input = ListInputState
    
    required init(with input: ListInputState, environment: EnvironmentMock) {
        switch input {
        case .add(let article):
            firstData.append(article)
        case .removeAll:
            firstData.removeAll()
        case .someAdd(let articles):
            firstData += articles
        }
        self.environment = environment
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func input(_ input: ListInputState) {
        switch input {
        case .add(let article):
            listViewModel.items.value.append(article)
        case .removeAll:
            listViewModel.items.value.removeAll()
        case .someAdd(let articles):
            listViewModel.items.value += articles
        }
        tableView.reloadData()
    }
    
    var environment: EnvironmentMock
    var dataSource: ListTableViewDataSource!
    var listViewModel = ListViewModel()
    let disposeBag = DisposeBag()
    var firstData: [Article] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constructCell()
        dataSource = ListTableViewDataSource(items: listViewModel.items.value)
        listViewModel.items.asDriver()
            .drive(self.tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        listViewModel.items.value = firstData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func constructCell() {
        tableView.register(cellType: ListTableViewCell.self)
    }
}
