//
//  UITextField+Kinetic.swift
//  Xieyiyizhi
//
//  Created by yakang wang on 2017/12/19.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import UIKit

extension Kinetic where Base: UITextField {
    
    var selectedRange: NSRange {
        guard let range = base.selectedTextRange else {
            return NSRange(location: 0, length: 0)
        }
        let location = base.offset(from: base.beginningOfDocument, to: range.start)
        let length = base.offset(from: range.start, to: range.end)
        return NSRange(location: location, length: length)
    }
}






