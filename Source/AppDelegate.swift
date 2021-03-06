//
//  AppDelegate.swift
//  SWTestApp
//
//  Created by Zach Eidenberger on 8/19/21.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        databaseManager.getRulebooksFromServer { (rulebooks, error) in
            if error != nil {
                print("There was an error getting the rulebooks from the server \(error)")
            }else {
                ruleBook = rulebooks.first ?? RulebookModel()
            }
        }
        if let currentUserSlug = UserDefaults.standard.string(forKey: "CurrentUserSlug") {
            databaseManager.getUserFromDatabase(slug: currentUserSlug) { (user) in
                if user == nil {
                    print("Couldn't get user from database")
                    try! Auth.auth().signOut()
                }else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                        userManager.currentUser = user
                        let launcherStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        UIApplication.shared.keyWindow?.rootViewController = launcherStoryBoard.instantiateViewController(withIdentifier: "LauncherViewController")
                    }
                }
            }
        }else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                let launcherStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                UIApplication.shared.keyWindow?.rootViewController = launcherStoryBoard.instantiateViewController(withIdentifier: "LauncherViewController")
            }
        }
        return true
    }
    
    func loadApp() {
        if let currentUserSlug = UserDefaults.standard.string(forKey: "CurrentUserSlug") {
            databaseManager.getUserFromDatabase(slug: currentUserSlug) { (user) in
                if user == nil {
                    print("Couldn't get user from database")
                    try! Auth.auth().signOut()
                }else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                        userManager.currentUser = user
                        let launcherStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        UIApplication.shared.keyWindow?.rootViewController = launcherStoryBoard.instantiateViewController(withIdentifier: "LauncherViewController")
                    }
                }
            }
        }else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                let launcherStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                UIApplication.shared.keyWindow?.rootViewController = launcherStoryBoard.instantiateViewController(withIdentifier: "LauncherViewController")
            }
        }
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

