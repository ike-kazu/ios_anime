import SwiftUI
import Combine
import Domain


class AnimeListState: ObservableObject {
    init(apiClient: APIClient) {
        self.apiClient = apiClient
        Task {
            do {
                let animes: [Anime.View] = try await apiClient.request(with: .getAnimes)
                self.allAnimes = animes
                await MainActor.run(body: {
                    for anime in animes {
                        let dayOfWeek = DayOfWeek(rawValue: anime.headSeason.weekNumber)
                        if self.selectedDayOfWeek == dayOfWeek {
                            if dayAnimes.contains(anime) {
                                dayAnimes.removeAll(where: { $0 == anime })
                            }
                            dayAnimes.append(anime)
                        }
                    }
                })
            } catch {
                print(error)
            }
        }
    }

    @MainActor @Published private(set) var selectedDayOfWeek: DayOfWeek = .sunday
    @MainActor @Published private(set) var dayAnimes: [Anime.View] = []

    private var allAnimes: [Anime.View] = []
    private let apiClient: APIClient

    @MainActor
    func updateDayOfWeek(_ dayOfWeek: DayOfWeek) {
        selectedDayOfWeek = dayOfWeek
        dayAnimes = allAnimes.filter { anime in
            selectedDayOfWeek == DayOfWeek(rawValue: anime.headSeason.weekNumber)
        }
    }
}
