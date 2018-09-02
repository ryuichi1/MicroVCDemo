//
//  ListTableViewDataSource.swift
//  MicroVCDemo
//
//  Created by 相田 隆一 on 2018/09/02.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import DataModel

class ListTableViewDataSource: NSObject {
    typealias Element = [Article]
    var items: Element = []
    
    init(items: Element) {
        self.items = items
        super.init()
    }
}

extension ListTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ListTableViewCell.self, for: indexPath)
        cell.label.text = items[indexPath.row].title
        return cell
    }
}

extension ListTableViewDataSource: RxTableViewDataSourceType {
    func tableView(_ tableView: UITableView, observedEvent:
        Event<[Article]>) {
        Binder(self) { (dataSource, element) in
            dataSource.items = element
            tableView.reloadData()
            }.on(observedEvent)
    }
}
