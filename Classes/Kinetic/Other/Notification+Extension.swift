//
//  Notification+Extension.swift
//  FileDemo
//
//  Created by yakang wang on 2017/12/20.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import Foundation


extension Notification.Name {
    public struct EmotionBig {
        public static let stopAnimation = Notification.Name(rawValue: "com.notification.name.stopAnimation")
        public static let startAnimation = Notification.Name(rawValue: "com.notification.name.startAnimation")
        
        public static let sendEmotion = Notification.Name(rawValue: "com.notification.name.sendEmotion")
    }
}


extension Notification {
    public struct EmotionBig {
        public static let sendEmotion = "com.notification.key.emoticon"
    }
}
