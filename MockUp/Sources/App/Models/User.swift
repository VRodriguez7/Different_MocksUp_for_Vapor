import Foundation
import FluentSQL
import Vapor

final class User: Model, Content {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "age")
    var age: Int
    
    @Field(key: "gender")
    var gender: String
    
    @Field(key: "birthday")
    var birthday: Date
    
    init() { }
    
    init(id: UUID? = nil, name: String, age: Int, gender: String, birthday: Date) {
        self.id = id
        self.name = name
        self.age = age
        self.gender = gender
        self.birthday = birthday
    }
    
}
