//
//  AddButtonViewController.swift
//  MicroVCDemo
//
//  Created by 相田 隆一 on 2018/09/02.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit
import MicroBase
import RxSwift
import RxCocoa

class AddButtonViewController: UIViewController, Instantiatable, Interactable {
    let disposeBag = DisposeBag()
    
    required init(with input: String) {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    typealias Input = String
    typealias Output = String
    @IBOutlet weak var addButton: UIButton!
    
    var handler: ((String) -> ())?

    func output(_ handler: ((String) -> Void)?) {
        self.handler = handler
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.handler!("add cell")
            })
            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
