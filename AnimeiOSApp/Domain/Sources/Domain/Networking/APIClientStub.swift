import Moya
import StubKit

public class APIClientStub: APIClient {

    public init() { }

    public func request<Response>(with target: AnimeTarget) async throws -> Response where Response : Decodable, Response : Encodable {
        switch target {
        case .getAnimes:
            var animes: [Anime.View] = []
            for i in 0..<10 {
                var anime = try! Stub.make(Anime.self)
                anime.id = i
                var season = try! Stub.make(Season.self)
                season.imageURL = "https://via.placeholder.com/150"
                season.weekNumber = i % 3
                season.anime = anime
                animes.append(Anime.View(base: anime, headSeason: season))
            }
            return animes as! Response
        case .getSeasons:
            var seasons: [Season] = []
            for i in 0..<10 {
                var season = try! Stub.make(Season.self)
                season.id = i
                season.imageURL = "https://via.placeholder.com/150"
                seasons.append(season)
            }
            return seasons as! Response
        case .getAnime(let animeID):
            var anime = try! Stub.make(Anime.self)
            anime.id = animeID
            return anime as! Response
        case .getSeason(let seasonID):
            var season = try! Stub.make(Season.self)
            season.imageURL = "https://via.placeholder.com/150"
            season.id = seasonID
            return season as! Response
        }
    }
}
