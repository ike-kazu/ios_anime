import Foundation


public struct Anime: Codable, Identifiable {
    public init(id: Int, title: String, origin: String) {
        self.id = id
        self.title = title
        self.origin = origin
    }

  public var id: Int
  public var title: String
  public var origin: String
}
