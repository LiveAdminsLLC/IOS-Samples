//
//  AppDelegate.swift
//  Demo
//
//  Created by Zaigham Maqsood on 14/01/2019.
//  Copyright © 2019 Zaigham Maqsood. All rights reserved.
//

import UIKit
import CoreData
import WGVisitor
import WGVisitorCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        WGVisitorViewController.setPreferredLanguage("en");
        
        
        let chatConfigurations =    [ "en":[
            "PrivacyLink": "https://www.eaglehills.com/privacy-policy/",
            "DomainNameLink": "thelivechatsoftware.com/les/chats/test6",
            "RTL": false ,
            "ApplicationName": "Eagle Hills"
            ],
                                      
                                      "ar":[
                                        
                                        "PrivacyLink": "https://www.eaglehills.com/ar/privacy-policy/",
                                        "DomainNameLink": "thelivechatsoftware.com/les/chats/test6",
                                        "RTL": true,
                                        "ApplicationName" : " إيجل هيلز"
            ]
            
        ]
           WGVisitorViewController.setChatConfigurations( chatConfigurations);
        
        
        let themeConfigurations = [
            
            "ThemeColor": UIColor.init( red:32/2555.0, green:42/2555.0 ,blue:69/2555.0 ,alpha:1),
            
            "ChatHeadColour": UIColor.init( red:32/2555.0, green:42/2555.0 ,blue:69/2555.0 ,alpha:1),
            
            "NavigationLogo": UIImage.init(imageLiteralResourceName: "logo"),
            
            "AgentMessage":[
                
                "backgroundColor": UIColor.init( red:32/2555.0, green:42/2555.0 ,blue:69/2555.0 ,alpha:1),
                "textColor": UIColor.white,
                "avatar" : UIImage.init(imageLiteralResourceName: "logo_for_agent")
                //
            ],
            
            "VisitorMessage":[
                
                //                "backgroundColor": UIColor.lightGray,
                "textColor": UIColor.darkText,
                
                //                "avatar" : UIImage.init(imageLiteralResourceName: "eaglehills_logo_for_chat")
                
            ]
            
            ] as [String : Any]
        
    
        WGVisitorViewController.setThemeConfigurations( themeConfigurations);
        
        WGVisitorViewController.shouldShowTimeStamp ( true)
        
        WGVisitorViewController.shouldShowChatHead(false)
        
        
        WGVisitorViewController.setVisitorName("Michael", phoneNumber: "12345678", email: "michael@test.com")
        
        
        // Override point for customization after application launch.
        return true
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
        // Saves changes in the application's managed object context before the application terminates.
//        self.saveContext()
    }
    
   
    
}

