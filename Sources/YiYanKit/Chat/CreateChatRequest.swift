//
//  CreateChatRequest.swift
//  wenxinkit
//
//  Created by wangyichengwork on 2023/8/1.
//

import AsyncHTTPClient
import NIOHTTP1
import Foundation

struct CreateChatRequest: Request {
    let method: HTTPMethod = .POST
    let path = "/rpc/2.0/ai_custom/v1/wenxinworkshop/chat/eb-instant"
    let body: Data?
    
    init(
        messages: [Chat.Message] = [],
        stream: Bool = false,
        temperature: Double = 0.95,
        penaltyScore: Double = 1.0,
        userID: String? = nil
    ) throws {
        
        let body = Body(
            messages: messages,
            stream: false,
            temperature: temperature,
            penaltyScore: penaltyScore,
            userID: userID
        )
                
        self.body = try Self.encoder.encode(body)
    }
}

extension CreateChatRequest {
    struct Body: Encodable {
        let messages: [Chat.Message]
        let stream: Bool
        let temperature: Double
        let penaltyScore: Double
        let userID: String?
            
        enum CodingKeys: CodingKey {
            case messages
            case stream
            case temperature
            case penaltyScore
            case userID
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            if !messages.isEmpty {
                try container.encode(messages, forKey: .messages)
            }

            try container.encode(temperature, forKey: .temperature)
            try container.encode(stream, forKey: .stream)
            
            try container.encodeIfPresent(userID, forKey: .userID)
        }
    }
}
