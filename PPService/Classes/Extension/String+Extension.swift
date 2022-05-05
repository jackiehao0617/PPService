//
//  String+Extension.swift
//  Pods-PPService_Example
//
//  Created by 郝鹏飞 on 2022/4/26.
//

import Foundation
import CommonCrypto

public extension String {
    /// 获取子字符串
    func subString(location: Int, length: Int) -> String {
        guard location + length <= self.count else { return "" }
        let startIndex = index(self.startIndex, offsetBy: location)
        let endIndex = index(self.startIndex, offsetBy: location + length)
        return String(self[startIndex..<endIndex])
    }
    /// MD5加密
    func md5() -> String {
        let str = self.cString(using: .utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: .utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deallocate()
        return String(format: hash as String)
    }
}
