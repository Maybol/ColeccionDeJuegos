//
//  AppDelegate.swift
//  Tablas
//
//  Created by Maybol Reynaldo Huracahua Gutierrez on 3/05/17.
//  Copyright © 2017 Maybol Reynaldo Huracahua Gutierrez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        print ("Se activo la func aplication del appDelegate")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("Se activo la fun applicationwillresignactive del appdelegate ")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    print("se activo la fun didenterbackgroud del app delegate")
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Se activo la fun  willenterforegroubnd del appdelegate")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
      print ("se activo la fun applicatiodidbecomeactive del appdelegate")
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("se activo la fun application willterminate del app delegate")
    }


}

