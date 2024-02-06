//
//  File.swift
//  
//
//  Created by Victor Rodriguez on 1/31/24.
//

import Fluent
import Vapor

final class Author: Model, Content {
    static let schema = "author"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Children(for: \.$author)
    var books:[Book]
    
    init() { }
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}



import Fluent
import Vapor

final class Book: Model, Content {
    static let schema = "test1"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Parent(key: "author_id")
    var author: Author
    
    init() { }
    
    init(id: UUID? = nil, title: String, authorID: Author.IDValue) {
        self.id = id
        self.title = title
        self.$author.id = authorID
    }
    
}



