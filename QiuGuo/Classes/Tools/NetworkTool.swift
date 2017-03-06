//
//  NetworkTool.swift
//  XMTV
//
//  Created by Mac on 2017/1/4.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

enum MethodType {
    case GET
    case POST
}

class NetworkTool {
    class func request(type: MethodType, urlString: String, paramters: [String: Any]? = nil, finishedCallback: @escaping (_ result: JSON) -> (),failureCallback:FailureBlock? = nil) {
        printData(message: urlString)
        // 获取类型
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        // 发送网络请求
        Alamofire.request(urlString, method: method, parameters: paramters).responseJSON { (response) in
            if response.result.isSuccess{
                if let json = response.result.value{
                    let swiftJson = JSON(json)
                    printData(message: swiftJson)
                    // 回调
                    finishedCallback(swiftJson)
                }else{
                    printData(message: response.result.error)                    
                }
            }else{
                failureCallback!(response.result.error)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
}
