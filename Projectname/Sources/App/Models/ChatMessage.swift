//
//  File.swift
//  
//
//  Created by Victor Rodriguez on 2/6/24.
//

import Vapor
import Fluent

final class ChatMessage:Model, Content {
    static let schema = "chat_messages"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "content")
    var content: String
    
    @Timestamp(key: "create_at", on: .create)
    var createdAt: Date?
    
    init() { }
    
    init(id: UUID? = nil, content: String) {
        self.id = id
        self.content = content
    }
}
