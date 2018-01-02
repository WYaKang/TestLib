//
//  FileManager+Kinetic.swift
//  ChatTeam
//
//  Created by yakang wang on 2017/12/22.
//  Copyright © 2017年 yakang wang. All rights reserved.
//

import Foundation

public struct FileManagerProxy {
    fileprivate let base: FileManager
    init(proxy: FileManager) {
        base = proxy
    }
}

extension FileManager: KineticCompatiable {
    public var ke: FileManagerProxy {
        return FileManagerProxy(proxy: self)
    }
}

extension FileManagerProxy {
    
    /// 判断是不是空文件夹
    func isDirectoryEmpty(url: URL) -> Bool {
        let isDir = base.fileExists(atPath: url.path)
        
        if isDir {
            // 判断有没有文件
            let names = try? base.contentsOfDirectory(atPath: url.path)
            if names != nil && names!.count > 0 {
                return false
            }
        } else {
            return true
        }
        return true
    }
    
}


