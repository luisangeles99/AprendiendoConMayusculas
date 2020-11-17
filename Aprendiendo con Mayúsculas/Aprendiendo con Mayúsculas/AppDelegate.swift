//
//  AppDelegate.swift
//  Aprendiendo con Mayúsculas
//
//  Created by Luis Alberto Angeles Morales on 12/10/20.
//  Copyright © 2020 Luis Alberto Angeles Morales. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var defaults = UserDefaults.standard


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupNotifications(on: application)

        // Override point for customization after application launch.
        
        UITabBar.appearance().backgroundColor = .darkGray
        UITabBar.appearance().tintColor = UIColor(red: 20/255, green: 20/255, blue: 200/255, alpha: 1)
        

        if (defaults.string(forKey: "color") == "purple"){
            UINavigationBar.appearance().backgroundColor = UIColor.systemIndigo
            UINavigationBar.appearance().tintColor = UIColor.systemIndigo
        } else if (defaults.string(forKey: "color") == "black") {
            UINavigationBar.appearance().backgroundColor = UIColor.label
            UINavigationBar.appearance().tintColor = UIColor.label
        } else {
            UINavigationBar.appearance().backgroundColor = UIColor.link
            UINavigationBar.appearance().tintColor = UIColor.link
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate {
    func setupNotifications(on application: UIApplication) {
        print("SETUP")
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Failed to request autorization for notification center: \(error.localizedDescription)")
                return
            }
            guard granted else {
                print("Failed to request autorization for notification center: not granted")
                return
            }
            DispatchQueue.main.async {
                application.registerForRemoteNotifications()
                let defaults = UserDefaults.standard
                let launchedBefore = defaults.bool(forKey: "launchedBefore")
                if launchedBefore{
                    print("launchedBefore")
                    
                }else{
                    LocalNotificationManager.setNotification(60, of: .seconds, repeats: true, title: "Sabías qué...", body: "Los nombres propios empiezan con mayúsculas", userInfo: ["aps" : ["hello" : "world"]])
                    print("not launched before")
                    defaults.setValue(true, forKey: "launchedBefore")
                }
            }
        }
    }
}

extension AppDelegate {
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        let token = tokenParts.joined()
        print("Device Token: \(token)")
        let bundleID = Bundle.main.bundleIdentifier
        print("Bundle ID: \(token) \(String(describing: bundleID))")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for remote notifications: \(error.localizedDescription)")
    }
    
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        defer { completionHandler() }
        guard response.actionIdentifier == UNNotificationDefaultActionIdentifier else { return }
        
        let content = response.notification.request.content
        print("Title: \(content.title)")
        print("Body: \(content.body)")
        
        if let userInfo = content.userInfo as? [String: Any],
            let aps = userInfo["aps"] as? [String: Any] {
            print("aps: \(aps)")
        }
    }
    
}
