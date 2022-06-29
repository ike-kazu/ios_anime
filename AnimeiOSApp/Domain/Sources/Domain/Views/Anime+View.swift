extension Anime {
    public struct View: Codable, Identifiable, Equatable {
        public static func == (lhs: Anime.View, rhs: Anime.View) -> Bool {
            lhs.id == rhs.id
        }

        public var base: Anime
        public var headSeason: Season

        public var id: Int {
            base.id
        }

        public init(
            base: Anime,
            headSeason: Season
        ) {
            self.base = base
            self.headSeason = headSeason
        }
    }
}
