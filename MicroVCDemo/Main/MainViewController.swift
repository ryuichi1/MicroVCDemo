//
//  ViewController.swift
//  MicroVCDemo
//
//  Created by 相田 隆一 on 2018/09/01.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit
import MicroBase

class MainViewController: UIViewController, Instantiatable {
    @IBOutlet weak var containerView: ContainerView!
    @IBOutlet weak var buttonContainerView: ContainerView!
    
    typealias Input = Void
    lazy var listViewController = self.containerView.makeContainer(for: ListViewController.self, parent: self)
    lazy var addButtonViewController = self.buttonContainerView.makeContainer(for: AddButtonViewController.self, parent: self, with: "")

    required init(with input: Input) {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "MainViewController"
        listViewController.input(.removeAll)
        addButtonViewController.output { (outputState) in
            switch outputState {
            case .addCell(let textString):
                self.listViewController.input(.addCell(textString))
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
