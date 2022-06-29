import Foundation
import Moya

public enum AnimeTarget {
    case getAnimes
    case getSeasons(animeID: Int)
    case getAnime(animeID: Int)
    case getSeason(animeID: Int, seasonID: Int)
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
    public var baseURL: URL {
        fatalError()
    }

    public var path: String {
        fatalError()
    }

    public var method: Moya.Method {
        fatalError()
    }

    public var task: Moya.Task {
        fatalError()
    }

    public var headers: [String : String]? {
        fatalError()
    }


}
