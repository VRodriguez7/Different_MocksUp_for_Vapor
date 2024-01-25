import NIOSSL
import Fluent
import FluentSQLiteDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.sqlite(.file("req.db")), as: .sqlite)

    app.migrations.add(CreateUser())
    
    try app.autoMigrate().wait()

    app.views.use(.leaf)

    

    // register routes
    try routes(app)
}
