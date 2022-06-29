//
//  AnimeListView.swift
//  AnimeiOSApp
//
//  Created by Fumiya Tanaka on 2022/06/25.
//

import SwiftUI
import Domain

struct AnimeListView: View {

    @ObservedObject var state: AnimeListState

    var body: some View {
        VStack {
            HStack {
                ForEach(0..<7) { i in
                    DayLabel(
                        dayOfWeek: DayOfWeek(rawValue: i)!,
                        isSelected: i == state.selectedDayOfWeek.rawValue,
                        onPressed: {
                            state.updateDayOfWeek(DayOfWeek(rawValue: i)!)
                        }
                    )
                }
            }
            List {
                ForEach(state.dayAnimes) { anime in
                    SeasonCardView(season: anime.headSeason, anime: anime.base)
                        .frame(height: 240)
                        .listRowInsets(
                            .init(
                                .init(
                                    top: 2,
                                    leading: 2,
                                    bottom: 2,
                                    trailing: 2
                                )
                            )
                        )
                }
            }.listStyle(.plain)
        }
        .padding()
    }
}

struct AnimeListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeListView(state: AnimeListState(apiClient: EnvAPIClientKey.defaultValue))
    }
}
