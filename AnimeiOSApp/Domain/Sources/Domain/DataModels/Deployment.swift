import Foundation

public struct Deployment: Codable, Identifiable {
    public init(id: Int, publishedAt: Date) {
        self.id = id
        self.publishedAt = publishedAt
    }

    public var id: Int
    public var publishedAt: Date
    public var platform: Platform?
}
