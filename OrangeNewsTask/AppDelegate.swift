//
//  AppDelegate.swift
//  OrangeNewsTask
//
//  Created by maika on 06/02/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initWindow()
        return true
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

extension AppDelegate {
    
    @available(iOS 13.0, *)
    @available(iOS 13.0, *)
    
    func initWindow() {
        let controller: UIViewController
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        if Core.shared.getCountryCode() == "" || Core.shared.getCategory() == "" {
            controller = storyboard.instantiateViewController(identifier: "selectCountryVC")

        } else {
            controller = storyboard.instantiateViewController(identifier: "homeVC")
        }
        
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
