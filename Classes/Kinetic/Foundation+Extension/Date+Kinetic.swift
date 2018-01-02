//
//  Date+Kinetic.swift
//  EmoticonDemo
//
//  Created by yakang wang on 2017/12/21.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import Foundation

public struct DataProxy {
    fileprivate let base: Data
    init(proxy: Data) {
        base = proxy
    }
}

extension Data: KineticCompatiable {
    public typealias CompatibleType = DataProxy
    public var ke: DataProxy {
        return DataProxy(proxy: self)
    }
}

enum ImageFormat {
    case unknown, PNG, JPEG, GIF
}

// MARK: - Image format
private struct ImageHeaderData {
    static var PNG: [UInt8] = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]
    static var JPEG_SOI: [UInt8] = [0xFF, 0xD8]
    static var JPEG_IF: [UInt8] = [0xFF]
    static var GIF: [UInt8] = [0x47, 0x49, 0x46]
}

extension DataProxy {
    var md5: String {
        let message = base.withUnsafeBytes { bytes -> [UInt8] in
            return Array(UnsafeBufferPointer(start: bytes, count: base.count))
        }
        
        let MD5Calculator = MD5(message)
        let MD5Data = MD5Calculator.calculate()
        
        var MD5String = String()
        for c in MD5Data {
            MD5String += String(format: "%02x", c)
        }
        return MD5String
    }
    
    var imageFormat: ImageFormat {
        var buffer = [UInt8](repeating: 0, count: 8)
        (base as NSData).getBytes(&buffer, length: 8)
        if buffer == ImageHeaderData.PNG {
            return .PNG
        } else if buffer[0] == ImageHeaderData.JPEG_SOI[0] &&
            buffer[1] == ImageHeaderData.JPEG_SOI[1] &&
            buffer[2] == ImageHeaderData.JPEG_IF[0]
        {
            return .JPEG
        } else if buffer[0] == ImageHeaderData.GIF[0] &&
            buffer[1] == ImageHeaderData.GIF[1] &&
            buffer[2] == ImageHeaderData.GIF[2]
        {
            return .GIF
        }
        
        return .unknown
    }
}

