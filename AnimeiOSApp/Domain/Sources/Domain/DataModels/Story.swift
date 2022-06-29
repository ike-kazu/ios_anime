import Foundation

public struct Story: Codable, Identifiable {
    public init(id: Int, title: String, duration: Int, seasonId: Int) {
        self.id = id
        self.title = title
        self.duration = duration
        self.seasonId = seasonId
    }

    public var id: Int
    public var title: String
    public var duration: Int
    public var seasonId: Int
}
