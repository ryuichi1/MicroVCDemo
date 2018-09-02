//
//  QiitaService.swift
//  Service
//
//  Created by 相田 隆一 on 2018/09/02.
//  Copyright © 2018年 相田 隆一. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import DataModel

public class QiitaService {
    public init() {
        
    }
    
    public func request(handler: @escaping ([Article]) -> Void){
        Alamofire.request("https://qiita.com/api/v2/items", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                
                var articles: [Article] = []
                let json = JSON(object)
                json.forEach { (_, json) in
                    let article = Article(
                        title: json["title"].string ?? "", 
                        userId: json["user"]["id"].string ?? ""
                    )
                    articles.append(article)
                }
                handler(articles)
        }
    }
}
