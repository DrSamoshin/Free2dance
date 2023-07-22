//
//  dancefreeApp.swift
//  dancefree
//
//  Created by Siarhei Samoshyn on 2023-06-16.
//

import SwiftUI

@main
struct dancefreeApp: App {
    // MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    @ObservedObject private var notificationManager = NotificationsManager()
    private var applicationDidBecomeActive = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
    @AppStorage("LocalNotificationsIsOn") private var localNotificationIsOn: Bool = false
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
                    .environmentObject(self.notificationManager)
            } else {
                MainView()
                    .environmentObject(self.notificationManager)
                    .onAppear() {
                        Task {
                            let status = await notificationManager.checkUserNotificationsPermission()
                            if status == .notDetermined {
                                self.localNotificationIsOn = await notificationManager.makeUserNotificationsAuthentication()
                            }
                        }
                    }
                    .onReceive(applicationDidBecomeActive) { _ in
                        Task {
                            let notificationIsAllowed = await notificationManager.makeUserNotificationsAuthentication()
                            if !notificationIsAllowed {
                                self.localNotificationIsOn = false
                            }
                        }
                    }
            }
        }
    }
}

