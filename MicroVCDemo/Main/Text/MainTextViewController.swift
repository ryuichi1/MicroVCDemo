//
//  MainTextViewController.swift
//  MicroVCDemo
//
//  Created by 相田 隆一 on 2018/09/01.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit
import MicroBase

class MainTextViewController: UIViewController, Instantiatable, Injectable {
    
    struct Model {
        var text: String?
        
        static var initial = Model(text: nil)
    }
    
    required init(with input: Model) {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        model = input
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    typealias Input = Model

    @IBOutlet weak var label: UILabel!
    var model = Model()
    
    func input(_ input: Model) {
        model = input
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = model.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
