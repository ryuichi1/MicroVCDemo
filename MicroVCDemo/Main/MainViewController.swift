//
//  ViewController.swift
//  MicroVCDemo
//
//  Created by 相田 隆一 on 2018/09/01.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit
import Mew

class EnvironmentMock { }

class MainViewController: UIViewController, Instantiatable {
    required init(with input: Void, environment: EnvironmentMock) {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    typealias Environment = EnvironmentMock
    
    @IBOutlet weak var containerView: ContainerView!
    @IBOutlet weak var buttonContainerView: ContainerView!
    var environment = EnvironmentMock()
    
    typealias Input = Void
    lazy var listViewController = self.containerView.makeContainer(for: ListViewController.self, parent: self)
    lazy var buttonViewController = self.buttonContainerView.makeContainer(for: ButtonViewController.self, parent: self, with: "")

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "MainViewController"
        listViewController.input(.removeAll)
        buttonViewController.output { (outputState) in
            switch outputState {
            case .add(let textString):
                self.listViewController.input(.add(textString))
            case .removeAll:
                self.listViewController.input(.removeAll)
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
