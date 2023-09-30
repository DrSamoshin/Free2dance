//
//  NotificationsManager.swift
//  ShapeOfMood
//
//  Created by Kanstantsin Ausianovich on 7.06.23.
//

import SwiftUI
import NotificationCenter

@MainActor
final class NotificationsManager: NSObject, ObservableObject {
    
    private let notificationCenter: UNUserNotificationCenter = .current()
    @Published var notificationUserInfo: [AnyHashable: Any]?
    
    override init() {
        super.init()
        self.notificationCenter.delegate = self
    }
    
    func setDailyNotification(at date: Date) {
        self.removeAll()
        
        let content = UNMutableNotificationContent()
        content.title = ["Dance your heart out and feel the rhythm.", "Don’t just move, express yourself.", "Dance is the language of the soul.", "Let your feet do the talking."].randomElement() ?? ""
        content.sound = UNNotificationSound.default
//        content.userInfo = ["nextView": "newMoodScreen", "tabSelection": 1]
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.hour, .minute], from: date)
        
        let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let dailyNotificationId = "DailyNotificationId"
        let request = UNNotificationRequest(identifier: dailyNotificationId, content: content, trigger: calendarTrigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func removeAll() {
        self.notificationCenter.removeAllPendingNotificationRequests()
    }
}

//MARK: Notifications Permissions
extension NotificationsManager {
    func checkUserNotificationsPermission() async -> UNAuthorizationStatus {
        return await withCheckedContinuation { continuation in
            self.notificationCenter.getNotificationSettings { settings in
                continuation.resume(returning: settings.authorizationStatus)
            }
        }
    }

    func makeUserNotificationsAuthentication() async -> Bool {
        return await withCheckedContinuation({ continuation in
            self.notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                continuation.resume(returning: granted)
            }
        })
    }
}

//MARK: Extension: UNUserNotificationCenterDelegate
extension NotificationsManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        
        self.notificationUserInfo = response.notification.request.content.userInfo
    }
}



