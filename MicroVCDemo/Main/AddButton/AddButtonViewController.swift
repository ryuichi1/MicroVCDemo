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
    typealias Output = OutputState
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    var handler: ((OutputState) -> ())?
    
    enum OutputState {
        case addCell(String)
        case removeAll
    }

    func output(_ handler: ((OutputState) -> Void)?) {
        self.handler = handler
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.handler!(.addCell("add cell"))
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
