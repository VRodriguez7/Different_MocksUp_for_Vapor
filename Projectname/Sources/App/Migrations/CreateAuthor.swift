//
//  File.swift
//  
//
//  Created by Victor Rodriguez on 1/31/24.
//

import Fluent

struct CreateAuthor: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return  database.schema(Author.schema)
        
            .id()
            .field("name", .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Author.schema).delete()
    }
}

struct CreateBook: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Book.schema)
            .id()
            .field("title", .string, .required)
            .field("author_id", .uuid, .required)
            .foreignKey("author_id", references: Author.schema, "id")
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(Book.schema).delete()
    }
}



