//
//  Client.swift
//  wenxinkit
//
//  Created by wangyichengwork on 2023/8/1.
//

import AsyncHTTPClient
import NIO
import NIOHTTP1
import Foundation

public struct Client {
    
    public let chats: ChatProvider
    
    init(requestHandler: RequestHandler) {
        self.chats = ChatProvider(requestHandler: requestHandler)
    }
    
    public init(
        httpClient: HTTPClient,
        configuration: Configuration
    ) {
        let requestHandler = NIORequestHandler(
            httpClient: httpClient,
            configuration: configuration
        )
        self.init(requestHandler: requestHandler)
    }
    
#if !os(Linux)
    public init(
        session: URLSession,
        configuration: Configuration
    ) {
        let requestHandler = URLSessionRequestHandler(
            session: session,
            configuration: configuration
        )
        self.init(requestHandler: requestHandler)
    }
#endif
}
