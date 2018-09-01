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
    @IBOutlet weak var secondContainerView: ContainerView!
    
    typealias Input = Void
    lazy var textViewController = self.containerView.makeContainer(for: MainTextViewController.self, parent: self)
    lazy var secondTextViewController = self.secondContainerView.makeContainer(for: MainTextViewController.self, parent: self)

    required init(with input: Input) {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "MainViewController"
        textViewController.input(MainTextViewController.Model(text: "hello world"))
        secondTextViewController.input(MainTextViewController.Model(text: "second test"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
