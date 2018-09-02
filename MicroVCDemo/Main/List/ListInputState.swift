//
//  ListInputState.swift
//  MicroVCDemo
//
//  Created by 相田 隆一 on 2018/09/02.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit
import DataModel

enum ListInputState {
    case add(Article)
    case someAdd([Article])
    case removeAll
}
