//
//  SettingsView.swift
//  DanceFree
//
//  Created by Kanstantsin Ausianovich on 7.03.23.
//

import SwiftUI
import UserNotifications
import MessageUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    @AppStorage("LocalNotificationsIsOn") private var localNotificationsIsOn: Bool = false
    @AppStorage("LocalNotificationsTime") private var localNotificationsTime: Date = .now
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    @State private var notificationAlertIsPresented: Bool = false
    @State private var userHasNotMailConfigurationAlertIsShow: Bool = false
    @EnvironmentObject private var notificationManager: NotificationsManager
    
    @State private var result: Result<MFMailComposeResult, Error>? = nil
    @State private var isShowingMailView = false
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            Form {
                #if DEBUG
                Section("Onboarding") {
                    Toggle("Onboarding", isOn: $isOnboarding)
                }
                #endif
                Section("Notifications") {
                    Toggle("Notifications", isOn: $localNotificationsIsOn)
                        .foregroundColor(Color.white)
                    if self.localNotificationsIsOn {
                        DatePicker("Notifications time", selection: $localNotificationsTime, displayedComponents: .hourAndMinute)
                    }
                }
                Section("Support") {
                    Group {
                    Button(action: {
                            if MFMailComposeViewController.canSendMail() {
                                self.isShowingMailView.toggle()
                            } else {
                                userHasNotMailConfigurationAlertIsShow = true
                            }
                            if result != nil {
                                print("Result: \(String(describing: result))")
                            }
                        }) {
                        Text("Contact Us")
                        }
                        Button(action: {
                            openApplicationRatingPage()
                            }) {
                            Text("Feedback")
                            }
                    }
                    .foregroundColor(Color.white)
                }
                Section {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text(self.applicationVersion)
                    }
                    .foregroundColor(Color.white)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }
        .onChange(of: localNotificationsIsOn) { granted in
            if granted {
                self.checkUserNotificationsPermission()
            } else {
                self.notificationManager.removeAll()
            }
        }
        .onChange(of: localNotificationsTime, perform: { newValue in
            notificationManager.setDailyNotification(at: localNotificationsTime)
        })
        .alert("Notifications are not allowed", isPresented: $notificationAlertIsPresented) {
            Button("Cancel", role: .cancel, action: {
                self.localNotificationsIsOn = false
            })
            Button("Settings") {
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl)
                    self.localNotificationsIsOn = false
                }
            }
        } message: {
            Text("To allow notifications for app go to Settings.")
        }
        .alert("Mail is not set up", isPresented: $userHasNotMailConfigurationAlertIsShow) {
            Button("Cancel", role: .cancel, action: {
                self.userHasNotMailConfigurationAlertIsShow = false
            })
        }
        
        .sheet(isPresented: $isShowingMailView) {
            MailView(result: $result) { composer in
                composer.setSubject(MailConfiguration.defaultMailSubject)
                composer.setToRecipients(["thesamoshin@gmail.com"])
                composer.setMessageBody(MailConfiguration.defaultMessageBody, isHTML: false)
            }
        }
        
    }
}



//MARK: Private | Helpers
private extension SettingsView {
    var applicationVersion: String {
        let appVersion = UIApplication.appVersion ?? ""
        let buildVersion = UIApplication.buildVersion ?? ""
        
        return "\(appVersion)(\(buildVersion))"
    }
    
    func openApplicationRatingPage() {
        guard let urlString = URL(string: "https://itunes.apple.com/app/6450379226") else { return }
        var components = URLComponents(url: urlString, resolvingAgainstBaseURL: false)
        components?.queryItems = [URLQueryItem(name: "action", value: "write-review")]
        let writeReviewUrl = components?.url
        
        guard let writeReviewUrl else { return }
        if UIApplication.shared.canOpenURL(writeReviewUrl) {
            UIApplication.shared.open(writeReviewUrl)
        }
    }
    
    func checkUserNotificationsPermission() {
        Task {
            let permission = await self.notificationManager.checkUserNotificationsPermission()
            switch permission {
                case .notDetermined:
                    let notificationIsAllowed = await notificationManager.makeUserNotificationsAuthentication()
                    self.localNotificationsIsOn = notificationIsAllowed
                case .denied:
                    notificationAlertIsPresented = true
                case .authorized:
                    notificationManager.setDailyNotification(at: localNotificationsTime)
                default:
                    break
            }
        }
    }
}

// MARK: - PREVIEW
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

