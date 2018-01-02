//
//  GlobalHelper.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/12/25.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit

class GlobalHelper {
    static let shared: GlobalHelper = GlobalHelper()
    private init() { }
    
    static func visibleViewController() -> UIViewController? {
        guard let rootViewController = UIApplication.shared.delegate?.window??.rootViewController else { return nil}
        let visibleVC = rootViewController.ke.visibleViewControllerIfExist()
        return visibleVC
    }
    
    
}
