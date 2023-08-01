//
//  Configuration.swift
//  wenxinkit
//
//  Created by wangyichengwork on 2023/8/1.
//

import Foundation
import NIOHTTP1

public struct Configuration {
    public let access_token: String
    public let api: API?

    public init(
        access_token: String,
        api: API? = nil
    ) {
        self.access_token = access_token
        self.api = api
    }
    
}
