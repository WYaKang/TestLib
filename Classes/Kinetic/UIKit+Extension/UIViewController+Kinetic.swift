//
//  UIViewController+Kinetic.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/12/25.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit


public struct UIViewControllerProxy {
    fileprivate let base: UIViewController
    init(proxy: UIViewController) {
        base = proxy
    }
}

extension UIViewController: KineticCompatiable {
    public typealias CompatibleType = UIViewControllerProxy
    public var ke: UIViewControllerProxy {
        return UIViewControllerProxy(proxy: self)
    }
}

extension UIViewControllerProxy {
    func visibleViewControllerIfExist() -> UIViewController? {
        if base.presentedViewController != nil {
            return base.presentedViewController!.ke.visibleViewControllerIfExist()
        }
        
        if base is UINavigationController {
            return (base as! UINavigationController).visibleViewController?.ke.visibleViewControllerIfExist()
        }
        
        if base is UITabBarController {
            return (base as! UITabBarController).selectedViewController?.ke.visibleViewControllerIfExist()
        }
        
        if base.isViewLoaded && base.view.window != nil {
            return base
        } else {
            print("没有找到可见的viewcontroller")
            return nil
        }
        
    }   
}

