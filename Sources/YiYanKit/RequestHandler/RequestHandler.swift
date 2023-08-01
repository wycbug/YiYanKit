//
//  RequestHandler.swift
//  wenxinkit
//
//  Created by wangyichengwork on 2023/8/1.
//

import Foundation


protocol RequestHandler {
    var configuration: Configuration { get }
    func perform<T: Decodable>(request: Request) async throws -> T
    func stream<T: Decodable>(request: Request) async throws -> AsyncThrowingStream<T, Error>
}

extension RequestHandler {
    func generateURL(for request: Request) throws -> String {
        var components = URLComponents()
        components.scheme = configuration.api?.scheme.value ?? request.scheme.value
        components.host = configuration.api?.host ?? request.host
        components.path = [configuration.api?.path, request.path]
            .compactMap { $0 }
            .joined()
        // 在query参数里添加access_token
        components.queryItems = [URLQueryItem(name: "access_token", value: configuration.access_token)]

        guard let url = components.url else {
            throw RequestHandlerError.invalidURLGenerated
        }
    
        return url.absoluteString
    }
}
