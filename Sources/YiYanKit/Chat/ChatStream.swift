//
//  ChatStream.swift
//  wenxinkit
//
//  Created by wangyichengwork on 2023/8/1.
//

import Foundation

public struct ChatStream {
    public let id: String
    public let object: String
    public let created: Date
    public let model: String
    public let result: String
    public let usage: Usage
}

extension ChatStream: Codable {}

