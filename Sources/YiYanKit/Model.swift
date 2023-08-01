//
//  Model.swift
//  wenxinkit
//
//  Created by wangyichengwork on 2023/7/26.
//

import Foundation

/**
 List and describe the various models available in the API.
 */
public struct Model: Codable {
    let id: String
    let object: String
    let created: Int
    let sentence_id: Int?
    let is_end: Bool?
    let is_truncated: Bool
    let result: String
    let need_clear_history: Bool?
    let ban_round: Int?
    let usage: Usage?
}

public protocol ModelID {
    var id: String { get }
}

extension Model {
    public enum ERNIEBOT: String, ModelID {
        case ernie_bot = "ernie_bot"
        case ernie_bot_turbo = "ernie_bot_turbo"
    }

    public enum Llama: String, ModelID {
        case llama_2_7b_chat = "llama-2-7b-chat"
        case llama_2_13b_chat = "llama-2-13b-chat"
        case llama_2_70b_chat = "llama-2-70b-chat"
    }
}

extension RawRepresentable where RawValue == String {
    public var id: String {
        rawValue
    }
}
