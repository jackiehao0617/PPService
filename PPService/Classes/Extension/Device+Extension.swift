//
//  Device+Extension.swift
//  Pods-PPService_Example
//
//  Created by 郝鹏飞 on 2022/4/26.
//

import Foundation
import CoreTelephony
public extension UIDevice {
    // 屏幕宽度
    static func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.width;
    }
    
    // 屏幕高度
    static func getScreenHeight() -> CGFloat {
        return UIScreen.main.bounds.height;
    }
    
    // 信号区高度
    @available(iOSApplicationExtension, unavailable)
    static func getStatusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 20;
        if #available(iOS 13.0, *) {
            let statusBarManager = UIApplication.shared.windows.first?.windowScene?.statusBarManager;
            if statusBarManager != nil {
                statusBarHeight =  statusBarManager!.statusBarFrame.size.height;
            }
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.size.height;
        }
        return statusBarHeight;
    }
    
    // 导航栏高度
    static func getNavBarHeight() -> CGFloat {
        return CGFloat(44);
    }
    
    // 导航头部高度
    @available(iOSApplicationExtension, unavailable)
    static func getHeaderHeight() -> CGFloat {
        return UIDevice.getStatusBarHeight() + UIDevice.getNavBarHeight();
    }
        
    // tabbar高度
    @available(iOSApplicationExtension, unavailable)
    static func getTabBarHeight() -> CGFloat {
        return CGFloat((isIPhoneXSerial() ? 83.0 : 49.0));
    }
    
    // 按屏幕宽度等比缩放
    static func getScalingW() -> CGFloat {
        return UIDevice.getScreenWidth() / CGFloat(375.0);
    }
    
    // 按屏幕高度等比缩放
    static func getScalingH() -> CGFloat {
        return UIDevice.getScreenHeight() / CGFloat(667.0);
    }
    
    // 只针对320缩放 W
    static func ScaleW() -> CGFloat {
        let kScale = UIDevice.getScreenWidth() < 375.0 ? UIDevice.getScreenWidth() / 375.0 : 1.0
        return kScale
    }
    
    // 只针对320缩放 H
    static func ScaleH() -> CGFloat {
        let kScale = UIDevice.getScreenHeight() < 667.0 ? UIDevice.getScreenHeight() / 667.0 : 1.0
        return kScale
    }
    
    static func getScaleMargin() -> CGFloat {
        let kScaleMargin = UIDevice.getScreenWidth() > 320.0 ? 16.0 : (16.0 * UIDevice.ScaleW())
        return kScaleMargin
    }
    
    // 按屏幕高度等比缩放
    @available(iOSApplicationExtension, unavailable)
    static func getIPhoneXBottom() -> CGFloat {
        return isIPhoneXSerial() ? CGFloat(34.0) : CGFloat(0);
    }
    
    @available(iOSApplicationExtension, unavailable)
    static func getIPhoneXTop() -> CGFloat {
        return isIPhoneXSerial() ? CGFloat(44.0) : CGFloat(0);
    }
    
    // iPhoneX系列
    @available(iOSApplicationExtension, unavailable)
    static func isIPhoneXSerial() -> Bool {
        var iphoneXSeries = false
        if UIDevice.current.userInterfaceIdiom != UIUserInterfaceIdiom.phone {
            return iphoneXSeries
        }
        if #available(iOS 11.0, *) {
            if let currentWindow = UIApplication.shared.windows.first {
                if currentWindow.safeAreaInsets.bottom > 0 {
                    iphoneXSeries = true
                }
            }
        }
        return iphoneXSeries
    }
    
    static func isIPhone_X() -> Bool {
        return (__CGSizeEqualToSize(CGSize(width: 1125, height: 2436), UIScreen.main.currentMode?.size ?? CGSize(width: 0, height: 0)) && !isIPad());
    }
    
    static func isIPhone_Xr() -> Bool {
        return (__CGSizeEqualToSize(CGSize(width: 828, height: 1792), UIScreen.main.currentMode?.size ?? CGSize(width: 0, height: 0)) && !isIPad());
    }
    
    static func isIPhone_XsMax() -> Bool {
        return (__CGSizeEqualToSize(CGSize(width: 1242, height: 2688), UIScreen.main.currentMode?.size ?? CGSize(width: 0, height: 0)) && !isIPad());
    }
    
    static func isIphone5() -> Bool {
        return getScreenWidth() < 375
    }
    
    static func isIPad() -> Bool {
        return (UIDevice().userInterfaceIdiom == UIUserInterfaceIdiom.pad);
    }
    
    static func isIPhone() -> Bool {
        return (UIDevice().userInterfaceIdiom == UIUserInterfaceIdiom.phone);
    }
    
    
    static func appVersion() -> String {
        let infoDictionary = Bundle.main.infoDictionary!
        let minorVersion = infoDictionary["CFBundleShortVersionString"]
        let appVersion = minorVersion as! String
        return appVersion
    }
    
    static func appVersionCode() -> String {
        var version = appVersion()
        version = version.replacingOccurrences(of: ".", with: "")
        return version
    }
    
    static func appModelName() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
          guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod_Touch_5"
        case "iPod7,1":                                 return "iPod_Touch_6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone_4"
        case "iPhone4,1":                               return "iPhone_4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone_5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone_5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone_5s"
            
        case "iPhone7,2":                               return "iPhone_6"
        case "iPhone7,1":                               return "iPhone_6_Plus"
            
        case "iPhone8,1":                               return "iPhone_6s"
        case "iPhone8,2":                               return "iPhone_6s_Plus"
            
        case "iPhone8,4":                               return "iPhone_SE"

        case "iPhone9,1", "iPhone9,3":                  return "iPhone_7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone_7_Plus"

        case "iPhone10,1", "iPhone10,4":                return "iPhone_8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone_8_Plus"
            
        case "iPhone10,3", "iPhone10,6":                return "iPhone_X"
            
        case "iPhone11,8":                              return "iPhone_XR"
            
        case "iPhone11,2":                              return "iPhone_XS"
            
        case "iPhone11,6", "iPhone11,4":                return "iPhone_XS_Max"
            
        case "iPhone12,1":                              return "iPhone_11"
        case "iPhone12,3":                              return "iPhone_11_Pro"
        case "iPhone12,5":                              return "iPhone_11_Pro_Max"

        case "iPhone12,8":                              return "iPhone_SE_2"

        case "iPhone13,1":                              return "iPhone_12_mini"
        case "iPhone13,2":                              return "iPhone_12"
        case "iPhone13,3":                              return "iPhone_12_Pro"
        case "iPhone13,4":                              return "iPhone_12_Pro_Max"

        case "iPhone14,4":                              return "iPhone_13_mini"
        case "iPhone14,5":                              return "iPhone_13"
        case "iPhone14,2":                              return "iPhone_13_Pro"
        case "iPhone14,3":                              return "iPhone_13_Pro_Max"

        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad_2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad_3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad_4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad_Air"
        case "iPad5,3", "iPad5,4":                      return "iPad_Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad_Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad_Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad_Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad_Mini 4"
        case "iPad6,7", "iPad6,8":                      return "iPad_Pro"
        case "AppleTV5,3":                              return "Apple_TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    
    ///是否越狱
    static func isAppRoot() -> Bool {
        let jailbreak_tool_paths = ["User/Applications/",
                                    "/Applications/Cydia.app",
                                    "/Library/MobileSubstrate/MobileSubstrate.dylib",
                                    "/bin/bash",
                                    "/usr/sbin/sshd",
                                    "/etc/apt"]
        for path in jailbreak_tool_paths {
            if FileManager.default.fileExists(atPath: path) {
                return true
            }
        }
        return false
    }
    
    ///电池电量
    static func getBatteryLevel() -> String {
        UIDevice.current.isBatteryMonitoringEnabled = true
        return String(format: "%.2f", UIDevice.current.batteryLevel)
    }
    
    ///充电状态
    static func getBatteryState() -> Int {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let batteryState = UIDevice.current.batteryState
        if batteryState == .charging {
            return 1
        }
        return 0
    }
    
    ///是否有sim卡
    static func hasSim() -> Bool {
        let count = getSimCardNum()
        return count == 0
    }
    
    ///sim卡数量
    static func getSimCardNum() -> Int {
        let networkInfo = CTTelephonyNetworkInfo.init()
        if #available(iOS 12.0, *) {
            if let ctDict = networkInfo.serviceSubscriberCellularProviders {
                if ctDict.keys.count == 1 {
                    return 1
                } else if ctDict.keys.count > 1 {
                    return 2
                }
            }
        } else {
            let carrier = networkInfo.subscriberCellularProvider
            if carrier?.mobileCountryCode?.count ?? 0 > 0 {
                return 1
            }
        }
        return 0
    }
    
    
}
