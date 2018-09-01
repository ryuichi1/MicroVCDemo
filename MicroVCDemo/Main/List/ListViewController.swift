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

class ListViewController: UIViewController, Instantiatable, Injectable {
    typealias Environment = EnvironmentMock
    typealias Input = ListInputState
    
    required init(with input: ListInputState, environment: EnvironmentMock) {
        self.environment = environment
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func input(_ input: ListInputState) {
        switch input {
        case .add(let textString):
            listViewModel.items.value.append(textString)
        case .removeAll:
            listViewModel.items.value = []
        }
        tableView.reloadData()
    }
    
    var environment: EnvironmentMock
    var dataSource: ListTableViewDataSource!
    var listViewModel = ListViewModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constructCell()
        dataSource = ListTableViewDataSource(items: listViewModel.items.value)
        listViewModel.items.asDriver()
            .drive(self.tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func constructCell() {
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ListTableViewCell")
    }
}
