//
//  URL+Kinetic.swift
//  MOJietu
//
//  Created by yakang wang on 2017/12/30.
//  Copyright © 2017年 jietu. All rights reserved.
//

import Foundation
import Photos

public struct URLProxy {
    fileprivate let base: URL
    init(proxy: URL) {
        base = proxy
    }
}

extension URL: KineticCompatiable {
    public typealias CompatibleType = URLProxy
    public var ke: URLProxy {
        return URLProxy(proxy: self)
    }
}

extension URLProxy {
//
    func imagePickerData(complete:((Data?, String?, UIImageOrientation, [AnyHashable: Any]?) -> Void)? = nil) {
        let fetchResult = PHAsset.fetchAssets(withALAssetURLs: [base], options: nil)
        if let phAsset = fetchResult.firstObject {
            PHImageManager.default().requestImageData(for: phAsset, options: nil) {
                (imageData, dataURI, orientation, info) -> Void in
                complete?(imageData, dataURI, orientation, info)
            }
        }
    }
}
