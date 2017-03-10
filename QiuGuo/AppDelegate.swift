//
//  AppDelegate.swift
//  QiuGuo
//
//  Created by cuirhong on 2017/2/27.
//  Copyright © 2017年 qiuyoukeji. All rights reserved.
//

import UIKit
import SwiftyJSON


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,WXApiDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow.init()
        let tabBarController = TabBarController.init()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
   
        
        initRegister()
        
       
      
        return true
    }
    
    //MARK:- 注册第三方
    private func  initRegister(){
        WeChatManager.registerWeChat()

    }
    
    
    
    
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return WXApi.handleOpen(url, delegate: self)
    }
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
         return WXApi.handleOpen(url, delegate: self)
    }
 

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}



func printLog<T> (message:T,fileName:String=#file,funcName:String=#function,lineNum:Int = #line) {
     print(message)
    #if DEBUG
        _ = (fileName as NSString).lastPathComponent
        print("(文件名：)\((fileName as NSString).lastPathComponent), (方法名): \(funcName),(行): \(lineNum)")
        
    #endif
}

func printData<T>(message:T,fileName:String=#file,funcName:String=#function,lineNum:Int = #line) {
   
    print(message)
}


