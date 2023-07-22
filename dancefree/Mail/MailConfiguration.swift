//
//  MailConfiguration.swift
//  dancefree
//
//  Created by Siarhei Samoshyn on 2023-06-20.
//

import Foundation
import UIKit


final class MailConfiguration {
    /// Default mail subject
    ///
    /// Structure: <App_Name>-<Version_number>
    static var defaultMailSubject: String {
        var appName = UIApplication.appName ?? ""
        
        if appName.isEmpty {
            appName = UIApplication.bundleName ?? ""
        }
        
        let appVersionString = UIApplication.appVersion ?? ""
        let subjectString = "\(appName)-\(appVersionString)"
        
        return subjectString
    }
    
    /// Default message body
    ///
    /// Structure: [<Version_number>, <Build_number>][<OS_Name> <OS_Version>][<Device>][<Date Time>][<Free_or_paid>]
    static var defaultMessageBody: String {
        let appVersion = UIApplication.appVersion ?? ""
        let buildNumber = UIApplication.buildVersion ?? ""
        let osName = UIDevice.current.systemName
        let osVersion = UIDevice.current.systemVersion
        let deviceModel = UIDevice.current.getDeviceName()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        
        let date = formatter.string(from: Date())
        
        let localeIdentifier = Locale.current.language.languageCode?.identifier ?? ""
        let bodyText = """
        
        
        
        PLEASE DON'T REMOVE - [\(appVersion), \(buildNumber)][\(osName) \(osVersion)][\(deviceModel)][\(date)][\(localeIdentifier)]
        """
        return bodyText
    }
}
