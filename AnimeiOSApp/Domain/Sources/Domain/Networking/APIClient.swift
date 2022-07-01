import Foundation
import Moya

public enum AnimeTarget {
    case getAnimes
    case getSeasons
    case getAnime(animeID: Int)
    case getSeason(seasonID: Int)
}

/// @mockable
public protocol APIClient {
    func request<Response: Codable>(with target: AnimeTarget) async throws -> Response
}

public actor APIClientImpl: APIClient {

    private let animeClient: MoyaProvider<AnimeTarget>

    public init() {
        self.animeClient = .init()
    }

    public func request<Response: Codable>(with target: AnimeTarget) async throws -> Response {
        let apiResponse: Moya.Response = try await withCheckedThrowingContinuation { continuation in
            animeClient.request(target) { result in
                continuation.resume(with: result)
            }
        }
        let response = try apiResponse.map(Response.self)
        return response
    }
}

extension AnimeTarget: TargetType {

    private var apiBaseURL: String {
        Secret.apiBaseURL
    }

    public var baseURL: URL {
        URL(string: apiBaseURL)!
    }

    public var path: String {
        switch self {
        case .getAnimes:
            return "/animes"
        case .getSeasons:
            return "/seasons"
        case .getAnime(let animeID):
            return "/animes/\(animeID)"
        case .getSeason(let seasonID):
            return "/animes/\(seasonID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .getAnimes:
            return .get
        case .getSeasons:
            return .get
        case .getAnime:
            return .get
        case .getSeason:
            return .get
        }
    }

    public var task: Moya.Task {
        fatalError()
    }

    public var headers: [String : String]? {
        fatalError()
    }


}
