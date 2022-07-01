//
//  SeasonListView.swift
//  AnimeiOSApp
//
//  Created by Fumiya Tanaka on 2022/06/25.
//

import SwiftUI
import Domain
import StubKit

struct SeasonListView: View {

    @Binding var seasons: [Season]
    @Binding var anime: Anime

    var body: some View {
        List {
            ForEach(seasons) { season in
                SeasonCardView(
                    season: season,
                    anime: anime
                )
                .frame(width: 320, height: 240)
            }
        }
    }
}

struct SeasonListView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonListView(
            seasons: .constant((0...9).map({ _ in
                try! Stub.make(Season.self)
            })),
            anime: .constant(try! Stub.make(Anime.self))
        )
    }
}
