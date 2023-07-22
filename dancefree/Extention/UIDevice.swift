//
//  UIDevice.swift
//  dancefree
//
//  Created by Siarhei Samoshyn on 2023-06-20.
//

import Foundation
import CoreHaptics
import UIKit

/// A representation of device screen types.
private enum RDIDeviceScreenType {
    case RDIDeviceScreenType132
    case RDIDeviceScreenType163
    case RDIDeviceScreenType264
    case RDIDeviceScreenType326
    case RDIDeviceScreenType401
    case RDIDeviceScreenType458
    case RDIDeviceScreenType460
    case RDIDeviceScreenType476
    case RDIDeviceScreenTypeNone
}

@objc
public extension UIDevice {
    
    /// A `Boolean` value indicating, whether current device has Haptic Engine
    @objc
    var hasHapticControl: Bool {
        return CHHapticEngine.capabilitiesForHardware().supportsHaptics
    }
    
    /// DPI value for current device
    @objc
    var dpiForCurrentDevice: CGFloat {
        let screenType = self.currentDeviceScreenType()
        var dpiValue: CGFloat = 0.0
        switch screenType {
        case .RDIDeviceScreenType132:
            dpiValue = 132.0
        case .RDIDeviceScreenType163:
            dpiValue = 163.0
        case .RDIDeviceScreenType264:
            dpiValue = 264.0
        case .RDIDeviceScreenType326:
            dpiValue = 326.0
        case .RDIDeviceScreenType401:
            dpiValue = 401.0
        case .RDIDeviceScreenType458:
            dpiValue = 458.0
        case .RDIDeviceScreenType460:
            dpiValue = 460.0
        case .RDIDeviceScreenType476:
            dpiValue = 476.0
        case .RDIDeviceScreenTypeNone:
            dpiValue = 163.0
        }
        
        dpiValue /= UIScreen.main.scale
        
        return dpiValue
    }
    
    /// Returns current device model
    /// - Returns: Name of current devices model.
    @objc
    func getDeviceName() -> String {
        let deviceCode = self.getDeviceCode()
        let deviceName = self.deviceNamesDict[deviceCode]
        
        guard let deviceName else {
            
            return UIDevice.current.model
        }
        
        return deviceName
    }
}

//MARK: - Private methods
private extension UIDevice {
    
    /// Apple devices dictionary
    var deviceNamesDict: [String: String] {
        return ["i386" : "iPhone Simulator",
                "x86_64" : "iPhone Simulator",
                "arm64" : "iPhone Simulator",
                "iPhone1,1" : "iPhone",
                "iPhone1,2" : "iPhone 3G",
                "iPhone2,1" : "iPhone 3GS",
                "iPhone3,1" : "iPhone 4",
                "iPhone3,2" : "iPhone 4 GSM Rev A",
                "iPhone3,3" : "iPhone 4 CDMA",
                "iPhone4,1" : "iPhone 4S",
                "iPhone5,1" : "iPhone 5 (GSM)",
                "iPhone5,2" : "iPhone 5 (GSM+CDMA)",
                "iPhone5,3" : "iPhone 5C (GSM)",
                "iPhone5,4" : "iPhone 5C (Global)",
                "iPhone6,1" : "iPhone 5S (GSM)",
                "iPhone6,2" : "iPhone 5S (Global)",
                "iPhone7,1" : "iPhone 6 Plus",
                "iPhone7,2" : "iPhone 6",
                "iPhone8,1" : "iPhone 6s",
                "iPhone8,2" : "iPhone 6s Plus",
                "iPhone8,4" : "iPhone SE (GSM)",
                "iPhone9,1" : "iPhone 7",
                "iPhone9,2" : "iPhone 7 Plus",
                "iPhone9,3" : "iPhone 7",
                "iPhone9,4" : "iPhone 7 Plus",
                "iPhone10,1" : "iPhone 8",
                "iPhone10,2" : "iPhone 8 Plus",
                "iPhone10,3" : "iPhone X Global",
                "iPhone10,4" : "iPhone 8",
                "iPhone10,5" : "iPhone 8 Plus",
                "iPhone10,6" : "iPhone X GSM",
                "iPhone11,2" : "iPhone XS",
                "iPhone11,4" : "iPhone XS Max",
                "iPhone11,6" : "iPhone XS Max Global",
                "iPhone11,8" : "iPhone XR",
                "iPhone12,1" : "iPhone 11",
                "iPhone12,3" : "iPhone 11 Pro",
                "iPhone12,5" : "iPhone 11 Pro Max",
                "iPhone12,8" : "iPhone SE 2nd Gen",
                "iPhone13,1" : "iPhone 12 Mini",
                "iPhone13,2" : "iPhone 12",
                "iPhone13,3" : "iPhone 12 Pro",
                "iPhone13,4" : "iPhone 12 Pro Max",
                "iPhone14,2" : "iPhone 13 Pro",
                "iPhone14,3" : "iPhone 13 Pro Max",
                "iPhone14,4" : "iPhone 13 Mini",
                "iPhone14,5" : "iPhone 13",
                "iPhone14,6" : "iPhone SE 3rd Gen",
                "iPhone14,7" : "iPhone 14",
                "iPhone14,8" : "iPhone 14 Plus",
                "iPhone15,2" : "iPhone 14 Pro",
                "iPhone15,3" : "iPhone 14 Pro Max",
                
                "iPod1,1" : "1st Gen iPod",
                "iPod2,1" : "2nd Gen iPod",
                "iPod3,1" : "3rd Gen iPod",
                "iPod4,1" : "4th Gen iPod",
                "iPod5,1" : "5th Gen iPod",
                "iPod7,1" : "6th Gen iPod",
                "iPod9,1" : "7th Gen iPod",
                
                "iPad1,1" : "iPad",
                "iPad1,2" : "iPad 3G",
                "iPad2,1" : "2nd Gen iPad",
                "iPad2,2" : "2nd Gen iPad GSM",
                "iPad2,3" : "2nd Gen iPad CDMA",
                "iPad2,4" : "2nd Gen iPad New Revision",
                "iPad3,1" : "3rd Gen iPad",
                "iPad3,2" : "3rd Gen iPad CDMA",
                "iPad3,3" : "3rd Gen iPad GSM",
                "iPad2,5" : "iPad mini",
                "iPad2,6" : "iPad mini GSM+LTE",
                "iPad2,7" : "iPad mini CDMA+LTE",
                "iPad3,4" : "4th Gen iPad",
                "iPad3,5" : "4th Gen iPad GSM+LTE",
                "iPad3,6" : "4th Gen iPad CDMA+LTE",
                "iPad4,1" : "iPad Air (WiFi)",
                "iPad4,2" : "iPad Air (GSM+CDMA)",
                "iPad4,3" : "1st Gen iPad Air (China)",
                "iPad4,4" : "iPad mini Retina (WiFi)",
                "iPad4,5" : "iPad mini Retina (GSM+CDMA)",
                "iPad4,6" : "iPad mini Retina (China)",
                "iPad4,7" : "iPad mini 3 (WiFi)",
                "iPad4,8" : "iPad mini 3 (GSM+CDMA)",
                "iPad4,9" : "iPad Mini 3 (China)",
                "iPad5,1" : "iPad mini 4 (WiFi)",
                "iPad5,2" : "4th Gen iPad mini (WiFi+Cellular)",
                "iPad5,3" : "iPad Air 2 (WiFi)",
                "iPad5,4" : "iPad Air 2 (Cellular)",
                "iPad6,3" : "iPad Pro (9.7 inch, WiFi)",
                "iPad6,4" : "iPad Pro (9.7 inch, WiFi+LTE)",
                "iPad6,7" : "iPad Pro (12.9 inch, WiFi)",
                "iPad6,8" : "iPad Pro (12.9 inch, WiFi+LTE)",
                "iPad6,11" : "iPad (2017)",
                "iPad6,12" : "iPad (2017)",
                "iPad7,1" : "iPad Pro 2nd Gen (WiFi)",
                "iPad7,2" : "iPad Pro 2nd Gen (WiFi+Cellular)",
                "iPad7,3" : "iPad Pro 10.5-inch 2nd Gen",
                "iPad7,4" : "iPad Pro 10.5-inch 2nd Gen",
                "iPad7,5" : "iPad 6th Gen (WiFi)",
                "iPad7,6" : "iPad 6th Gen (WiFi+Cellular)",
                "iPad7,11" : "iPad 7th Gen 10.2-inch (WiFi)",
                "iPad7,12" : "iPad 7th Gen 10.2-inch (WiFi+Cellular)",
                "iPad8,1" : "iPad Pro 11 inch 3rd Gen (WiFi)",
                "iPad8,2" : "iPad Pro 11 inch 3rd Gen (1TB, WiFi)",
                "iPad8,3" : "iPad Pro 11 inch 3rd Gen (WiFi+Cellular)",
                "iPad8,4" : "iPad Pro 11 inch 3rd Gen (1TB, WiFi+Cellular)",
                "iPad8,5" : "iPad Pro 12.9 inch 3rd Gen (WiFi)",
                "iPad8,6" : "iPad Pro 12.9 inch 3rd Gen (1TB, WiFi)",
                "iPad8,7" : "iPad Pro 12.9 inch 3rd Gen (WiFi+Cellular)",
                "iPad8,8" : "iPad Pro 12.9 inch 3rd Gen (1TB, WiFi+Cellular)",
                "iPad8,9" : "iPad Pro 11 inch 4th Gen (WiFi)",
                "iPad8,10" : "iPad Pro 11 inch 4th Gen (WiFi+Cellular)",
                "iPad8,11" : "iPad Pro 12.9 inch 4th Gen (WiFi)",
                "iPad8,12" : "iPad Pro 12.9 inch 4th Gen (WiFi+Cellular)",
                "iPad11,1" : "iPad mini 5th Gen (WiFi)",
                "iPad11,2" : "iPad mini 5th Gen",
                "iPad11,3" : "iPad Air 3rd Gen (WiFi)",
                "iPad11,4" : "iPad Air 3rd Gen",
                "iPad11,6" : "iPad 8th Gen (WiFi)",
                "iPad11,7" : "iPad 8th Gen (WiFi+Cellular)",
                "iPad12,1" : "iPad 9th Gen (WiFi)",
                "iPad12,2" : "iPad 9th Gen (WiFi+Cellular)",
                "iPad14,1" : "iPad mini 6th Gen (WiFi)",
                "iPad14,2" : "iPad mini 6th Gen (WiFi+Cellular)",
                "iPad13,1" : "iPad Air 4th Gen (WiFi)",
                "iPad13,2" : "iPad Air 4th Gen (WiFi+Cellular)",
                "iPad13,4" : "iPad Pro 11 inch 5th Gen",
                "iPad13,5" : "iPad Pro 11 inch 5th Gen",
                "iPad13,6" : "iPad Pro 11 inch 5th Gen",
                "iPad13,7" : "iPad Pro 11 inch 5th Gen",
                "iPad13,8" : "iPad Pro 12.9 inch 5th Gen",
                "iPad13,9" : "iPad Pro 12.9 inch 5th Gen",
                "iPad13,10" : "iPad Pro 12.9 inch 5th Gen",
                "iPad13,11" : "iPad Pro 12.9 inch 5th Gen",
                "iPad13,16" : "iPad Air 5th Gen (WiFi)",
                "iPad13,17" : "iPad Air 5th Gen (WiFi+Cellular)",
                "iPad13,18" : "iPad 10th Gen",
                "iPad13,19" : "iPad 10th Gen",
                "iPad14,3" : "iPad Pro 11 inch 4th Gen",
                "iPad14,4" : "iPad Pro 11 inch 4th Gen",
                "iPad14,5" : "iPad Pro 12.9 inch 6th Gen",
                "iPad14,6" : "iPad Pro 12.9 inch 6th Gen",
                
                "Watch1,1" : "Apple Watch 38mm case",
                "Watch1,2" : "Apple Watch 42mm case",
                "Watch2,6" : "Apple Watch Series 1 38mm case",
                "Watch2,7" : "Apple Watch Series 1 42mm case",
                "Watch2,3" : "Apple Watch Series 2 38mm case",
                "Watch2,4" : "Apple Watch Series 2 42mm case",
                "Watch3,1" : "Apple Watch Series 3 38mm case (GPS+Cellular)",
                "Watch3,2" : "Apple Watch Series 3 42mm case (GPS+Cellular)",
                "Watch3,3" : "Apple Watch Series 3 38mm case (GPS)",
                "Watch3,4" : "Apple Watch Series 3 42mm case (GPS)",
                "Watch4,1" : "Apple Watch Series 4 40mm case (GPS)",
                "Watch4,2" : "Apple Watch Series 4 44mm case (GPS)",
                "Watch4,3" : "Apple Watch Series 4 40mm case (GPS+Cellular)",
                "Watch4,4" : "Apple Watch Series 4 44mm case (GPS+Cellular)",
                "Watch5,1" : "Apple Watch Series 5 40mm case (GPS)",
                "Watch5,2" : "Apple Watch Series 5 44mm case (GPS)",
                "Watch5,3" : "Apple Watch Series 5 40mm case (GPS+Cellular)",
                "Watch5,4" : "Apple Watch Series 5 44mm case (GPS+Cellular)",
                "Watch5,9" : "Apple Watch SE 40mm case (GPS)",
                "Watch5,10" : "Apple Watch SE 44mm case (GPS)",
                "Watch5,11" : "Apple Watch SE 40mm case (GPS+Cellular)",
                "Watch5,12" : "Apple Watch SE 44mm case (GPS+Cellular)",
                "Watch6,1" : "Apple Watch Series 6 40mm case (GPS)",
                "Watch6,2" : "Apple Watch Series 6 44mm case (GPS)",
                "Watch6,3" : "Apple Watch Series 6 40mm case (GPS+Cellular)",
                "Watch6,4" : "Apple Watch Series 6 44mm case (GPS+Cellular)",
                "Watch6,6" : "Apple Watch Series 7 41mm case (GPS)",
                "Watch6,7" : "Apple Watch Series 7 45mm case (GPS)",
                "Watch6,8" : "Apple Watch Series 7 41mm case (GPS+Cellular)",
                "Watch6,9" : "Apple Watch Series 7 45mm case (GPS+Cellular)",
                "Watch6,10" : "Apple Watch SE 40mm case (GPS)",
                "Watch6,11" : "Apple Watch SE 44mm case (GPS)",
                "Watch6,12" : "Apple Watch SE 40mm case (GPS+Cellular)",
                "Watch6,13" : "Apple Watch SE 44mm case (GPS+Cellular)",
                "Watch6,14" : "Apple Watch Series 8 41mm case (GPS)",
                "Watch6,15" : "Apple Watch Series 8 45mm case (GPS)",
                "Watch6,16" : "Apple Watch Series 8 41mm case (GPS+Cellular)",
                "Watch6,17" : "Apple Watch Series 8 45mm case (GPS+Cellular)",
                "Watch6,18" : "Apple Watch Ultra"]
    }
    
    // iPad 9,7" without Retina
    var dpi132Devices: [String] {
        return ["iPad1,1", "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4"]
    }
    
    // iPad mini 7,9" without Retina
    // iPod Touch without Retina (1G, 2G, 3G)
    var dpi163Devices: [String] {
        return ["iPad2,5", "iPad2,6", "iPad2,7", "iPod1,1", "iPod2,1", "iPod3,1"]
    }
    
    // iPad 9,7" with Retina
    // iPad Pro (all)
    var dpi264Devices: [String] {
        return ["iPad4,1", "iPad4,2", "iPad5,3", "iPad5,4", "iPad3,1", "iPad3,2",
                "iPad3,3", "iPad3,4", "iPad3,5", "iPad3,6", "iPad6,7", "iPad6,8",
                "iPad5,3", "iPad5,4", "iPad6,11", "iPad6,12", "iPad7,1", "iPad7,2",
                "iPad7,3", "iPad7,4", "iPad7,5", "iPad7,6", "iPad7,11", "iPad7,12",
                "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4", "iPad8,5", "iPad8,6",
                "iPad8,7", "iPad8,8", "iPad8,9", "iPad8,10", "iPad8,11", "iPad8,12",
                "iPad11,3", "iPad11,4", "iPad11,6", "iPad11,7", "iPad12,1", "iPad12,2",
                "iPad13,1", "iPad13,2", "iPad13,4", "iPad13,5", "iPad13,6", "iPad13,7",
                "iPad13,8", "iPad13,9", "iPad13,10", "iPad13,11", "iPad13,16", "iPad13,17"]
    }
    
    // iPad mini 7,9" with Retina
    // iPhone with Retina (4, 4s, 5, 5C, 5S, 6, 6S, 7, 8)
    // iPod Touch with Retina (4G, 5G, 6G)
    var dpi326Devices: [String] {
        return ["iPhone3,1", "iPhone3,3", "iPhone4,1", "iPad4,4", "iPad4,5","iPhone5,3",
                "iPhone5,4", "iPhone6,1", "iPhone6,2", "iPhone7,2", "iPhone8,1","iPhone9,1",
                "iPhone9,3", "iPhone10,1", "iPhone10,4", "iPhone11,8", "iPhone12,1","iPhone12,8", "iPhone14,6",
                "iPad4,6", "iPad4,7", "iPad4,8", "iPhone5,1", "iPhone5,2","iPad5,1", "iPad5,2",
                "iPod4,1", "iPod5,1", "iPod7,1", "iPod9,1", "iPad11,1","iPad11,2", "iPad14,1", "iPad14,2"]
    }
    
    // iPhone with @3x Retina (6+, 6S+, 7+, 8+)
    var dpi401Devices: [String] {
        return ["iPhone7,1", "iPhone8,2", "iPhone9,2", "iPhone9,4", "iPhone10,2", "iPhone10,5"]
    }
    
    // iPhone X with @3x Retina
    var dpi458Devices: [String] {
        return ["iPhone10,3", "iPhone10,6", "iPhone11,2", "iPhone11,4", "iPhone11,6",
                "iPhone12,3", "iPhone12,5", "iPhone13,4", "iPhone14,3", "iPhone14,8"]
    }
    
    // iPhone 12 and 12 Pro
    var dpi460Devices: [String] {
        return ["iPhone13,2", "iPhone13,3", "iPhone14,2", "iPhone14,5", "iPhone14,7", "iPhone15,2", "iPhone15,3"]
    }
    
    // iPhone 12 mini
    var dpi476Devices: [String] {
        return ["iPhone13,1", "iPhone14,4"]
    }
    
    func currentDeviceScreenType() -> RDIDeviceScreenType {
        let deviceCode = UIDevice.current.getDeviceCode()
        
        if self.dpi132Devices.contains(deviceCode) {
            return .RDIDeviceScreenType132
        } else if self.dpi163Devices.contains(deviceCode) {
            return .RDIDeviceScreenType163
        } else if self.dpi264Devices.contains(deviceCode) {
            return .RDIDeviceScreenType326
        } else if self.dpi326Devices.contains(deviceCode) {
            return .RDIDeviceScreenType326
        } else if self.dpi401Devices.contains(deviceCode) {
            return .RDIDeviceScreenType401
        } else if self.dpi458Devices.contains(deviceCode) {
            return .RDIDeviceScreenType458
        } else if self.dpi460Devices.contains(deviceCode) {
            return .RDIDeviceScreenType476
        } else if self.dpi476Devices.contains(deviceCode) {
            return .RDIDeviceScreenType476
        } else {
            // Device isn't found in list, it's probably rather new one. Try to guess default DPI by type.
            let deviceFamily = UIDevice.current.model
            if deviceFamily == "iPad" {
                return .RDIDeviceScreenType264
            } else {
                return .RDIDeviceScreenType326
            }
        }
    }
    
    func getDeviceCode() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8,
                    value != 0 else {
                return identifier
            }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
}
