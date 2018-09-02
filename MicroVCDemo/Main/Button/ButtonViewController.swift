//
//  AddButtonViewController.swift
//  MicroVCDemo
//
//  Created by 相田 隆一 on 2018/09/02.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit
import Mew
import RxSwift
import RxCocoa
import DataModel

class ButtonViewController: UIViewController, Instantiatable, Interactable {
    typealias Environment = EnvironmentMock
    typealias Input = Article?
    typealias Output = ListInputState
    
    required init(with input: Article?, environment: EnvironmentMock) {
        self.environment = environment
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func output(_ handler: ((ListInputState) -> Void)?) {
        self.handler = handler
    }
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    var environment: EnvironmentMock
    var handler: ((ListInputState) -> ())?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.handler!(.add(Article(title: "test", userId: "test_user")))
            })
            .disposed(by: disposeBag)
        removeButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.handler!(.removeAll)
            })
            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
