public struct Account: Codable, Identifiable {
    
    public init(id: Int, name: String, role: Bool) {
        self.id = id
        self.name = name
        self.role = role
    }

  public var id: Int
  public var name: String
  public var role: Bool
}
