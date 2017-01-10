//
//  AppDelegate.swift
//  HackerNews
//
//  Copyright (c) 2015 Amit Burstein. All rights reserved.
//  See LICENSE for licensing information.
//

import UIKit
import MobileCenter
import MobileCenterAnalytics
import MobileCenterCrashes

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  // MARK: Properties
  
  let GlobalTintColor = UIColor(red: 1.0, green: 0.4, blue: 0.0, alpha: 1.0)
  
  var window: UIWindow?
  
  // MARK: UIApplicationDelegate
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
    configureUI()
    
    var keys: NSDictionary?
    
    if let path = NSBundle.mainBundle().pathForResource("Keys", ofType: "plist") {
      keys = NSDictionary(contentsOfFile: path)
    }
    if let dict = keys {
      let MobileCenterSecret = dict["MobileCenterSecret"] as? String
      MSMobileCenter.start(MobileCenterSecret, withServices:[
        MSAnalytics.self,
        MSCrashes.self
        ])
      let ColorSecret = dict["ColorSecret"] as? String
      NSLog("MC Secret: %@", ColorSecret ?? "<nil>")

    }
    return true
  }
  
  // MARK: Functions
  
  func configureUI() {
    window?.tintColor = GlobalTintColor
  
  }
}
