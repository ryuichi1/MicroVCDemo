//
//  ViewController.swift
//  MicroVCDemo
//
//  Created by 相田 隆一 on 2018/09/01.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit
import Mew
import Service

class EnvironmentMock { }

class MainViewController: UIViewController, Instantiatable {
    typealias Environment = EnvironmentMock
    typealias Input = Void

    required init(with input: Void, environment: EnvironmentMock) {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var containerView: ContainerView!
    @IBOutlet weak var buttonContainerView: ContainerView!
    
    var environment = EnvironmentMock()
    
    lazy var listViewController = self.containerView.makeContainer(for: ListViewController.self, parent: self)
    lazy var buttonViewController = self.buttonContainerView.makeContainer(for: ButtonViewController.self, parent: self, with: nil)
    var qiitaService = QiitaService()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "MainViewController"
        buttonViewController.output { (outputState) in
            switch outputState {
            case .request:
                self.reqeust()
            case .removeAll:
                self.listViewController.input(.removeAll)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reqeust() {
        self.qiitaService.request(handler: { (articles) in
            self.listViewController.input(.someAdd(articles))
        })
    }
}
