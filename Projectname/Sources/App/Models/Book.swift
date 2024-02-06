////
////  File.swift
////  
////
////  Created by Victor Rodriguez on 2/5/24.
////
//
//import Fluent
//import Vapor
//
//final class Book: Model, Content {
//    static let schema = "test1"
//    
//    @ID(key:.id)
//    var id: UUID?
//    
//    @Field(key: "title")
//    var title: String
//    
//    @Parent(key: "author_id")
//    var authorID: Author.ID
//    
//    init() { }
//    
//    init(id: UUID? = nil, title: String, authorID: Author.ID) {
//        self.id = id
//        self.title = title
//        self.$authorID.value = authorID
//    }
//    
//}
//
//
