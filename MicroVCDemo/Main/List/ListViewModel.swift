//
//  LiveViewModel.swift
//  MicroVCDemo
//
//  Created by 相田 隆一 on 2018/09/02.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import DataModel

class ListViewModel: NSObject {
    var items = Variable<[Article]>([])
}
