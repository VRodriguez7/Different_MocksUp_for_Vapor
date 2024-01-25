import Fluent

struct CreateUser: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("user")
            .id()
            .field("name", .string, .required)
            .field("age", .int, .required)
            .field("gender", .string, .required)
            .field("birthday", .date, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("user").delete()
    }
}
