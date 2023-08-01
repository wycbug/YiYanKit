//
//  ChatProvider.swift
//  wenxinkit
//
//  Created by wangyichengwork on 2023/8/1.
//

public struct ChatProvider {
    
    private let requestHandler: RequestHandler
    
    init(requestHandler: RequestHandler) {
        self.requestHandler = requestHandler
    }
    
    /**
     Create chat completion
     POST
      
     https://api.openai.com/v1/chat/completions

     Creates a chat completion for the provided prompt and parameters
     */
    public func create(
        messages: [Chat.Message] = [],
        stream: Bool = false,
        temperature: Double = 0.95,
        penaltyScore: Double = 1.0,
        userID: String? = nil
    ) async throws -> Chat {
        
        let request = try CreateChatRequest(
            messages: messages,
            stream: false,
            temperature: temperature,
            penaltyScore: penaltyScore,
            userID: userID
            
        )
    
        return try await requestHandler.perform(request: request)

    }
    
    /**
     Create chat completion
     POST
      
     https://api.openai.com/v1/chat/completions

     Creates a chat completion for the provided prompt and parameters
     
     stream If set, partial message deltas will be sent, like in ChatGPT.
     Tokens will be sent as data-only server-sent events as they become available, with the stream terminated by a data: [DONE] message.
     
     https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#event_stream_format
     */
    public func stream(
        messages: [Chat.Message] = [],
        stream: Bool = false,
        temperature: Double = 0.95,
        penaltyScore: Double = 1.0,
        userID: String? = nil
    ) async throws -> AsyncThrowingStream<ChatStream, Error> {
        
        let request = try CreateChatRequest(
            messages: messages,
            stream: true,
            temperature: temperature,
            penaltyScore: penaltyScore,
            userID: userID
        )
    
        return try await requestHandler.stream(request: request)
                
    }
}
