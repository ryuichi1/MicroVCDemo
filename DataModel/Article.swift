//
//  Article.swift
//  DataModel
//
//  Created by 相田 隆一 on 2018/09/02.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit

public class Article {
    public var title: String
    public var userId: String
    
    public init(title: String, userId: String) {
        self.title = title
        self.userId = userId
    }
}
