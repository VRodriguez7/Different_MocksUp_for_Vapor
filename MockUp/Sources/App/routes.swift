import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Create User"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.post("user") { req -> EventLoopFuture<User> in
        let user = try req.content.decode(User.self)
        return user.create(on: req.db).map { user }
    }
  
}
