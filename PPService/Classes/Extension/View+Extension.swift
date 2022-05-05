//
//  View+Extension.swift
//  Pods-PPService_Example
//
//  Created by 郝鹏飞 on 2022/4/26.
//

import Foundation

/// bounds
public extension UIView {
    var pp_leading: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newVal) {
            var frame = self.frame
            frame.origin.x = newVal
            self.frame = frame
        }
    }
    
    var pp_tailing: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set(newVal) {
            var frame = self.frame
            frame.origin.x = newVal - self.frame.size.width
            self.frame = frame
        }
    }
    
    var pp_top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newVal) {
            var frame = self.frame
            frame.origin.y = newVal
            self.frame = frame
        }
    }
    
    var pp_bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set(newVal) {
            var frame = self.frame
            frame.origin.y = newVal - self.frame.size.height
            self.frame = frame
        }
    }
    
    var pp_width: CGFloat {
        get {
            return self.frame.size.width
        }
        set(newVal) {
            var frame = self.frame
            frame.size.width = newVal
            self.frame = frame
        }
    }
    
    var pp_height: CGFloat {
        get {
            return self.frame.size.height
        }
        set(newVal) {
            var frame = self.frame
            frame.size.height = newVal
            self.frame = frame
        }
    }
    
    var pp_size: CGSize {
        get {
            return self.frame.size
        }
        set(newVal) {
            var frame: CGRect = self.frame
            frame.size = newVal
            self.frame = frame
        }
    }
    var pp_centerX: CGFloat {
        get {
            return self.center.x
        }
        set(newVal) {
            var center: CGPoint = self.center
            center.x = newVal
            self.center = center
        }
    }
    var pp_centerY: CGFloat {
        get {
            return self.center.y
        }
        set(newVal) {
            var center: CGPoint = self.center
            center.y = newVal
            self.center = center
        }
    }
}
