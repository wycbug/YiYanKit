//
//  Usage.swift
//  wenxinkit
//
//  Created by wangyichengwork on 2023/7/26.
//

import Foundation

public struct Usage {
    public let promptTokens: Int
    public let completionTokens: Int?
    public let totalTokens: Int
}

extension Usage: Codable {}

