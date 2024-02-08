//
//  File.swift
//  
//
//  Created by Victor Rodriguez on 2/6/24.
//

import Vapor
import Fluent

struct CreateChatMessage: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("chat_nessages")
            .id()
            .field("content", .string, .required)
            .field("created_at", .datetime, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("chat_message").delete()
    }
}
