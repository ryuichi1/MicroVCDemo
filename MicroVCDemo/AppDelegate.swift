//
//  AppDelegate.swift
//  MicroVCDemo
//
//  Created by 相田 隆一 on 2018/09/01.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: MainViewController(with: {}()))
//        self.window?.rootViewController = UINavigationController(rootViewController: ListViewController(with: []))
        self.window?.makeKeyAndVisible()
        return true
    }
}

