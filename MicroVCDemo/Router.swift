//
//  Router.swift
//  MicroVCDemo
//
//  Created by 相田 隆一 on 2018/09/02.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit
import Mew

class Router {
    func push<T: Instantiatable>(vc: UINavigationController, classType: T.Type, input: T.Input, environment: T.Environment) {
        let toVC = T(with: input, environment: environment)
        vc.pushViewController(toVC as! UIViewController, animated: true)
    }
}
