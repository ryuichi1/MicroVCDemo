//
//  ListViewController.swift
//  MicroVCDemo
//
//  Created by 相田 隆一 on 2018/09/02.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit
import MicroBase

class ListViewController: UIViewController, Instantiatable, Injectable {
    typealias Input = String

    required init(with input: String) {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func input(_ input: String) {
        list.append(input)
        tableView.reloadData()
    }
    
    var list: [String] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constructCell()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func constructCell() {
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ListTableViewCell")
    }
}

extension ListViewController: UITableViewDelegate {
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        cell.label.text = list[indexPath.row]
        return cell
    }
}
