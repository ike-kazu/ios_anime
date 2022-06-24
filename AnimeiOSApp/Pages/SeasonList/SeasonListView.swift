//
//  SeasonListView.swift
//  AnimeiOSApp
//
//  Created by Fumiya Tanaka on 2022/06/25.
//

import SwiftUI
import Domain

struct SeasonListView: View {

    var body: some View {
        List {
            ForEach(0..<5) { _ in
                SeasonCardView(
                    season: Season(
                        id: 1,
                        title: "Testtttt",
                        imageURL: "https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/300444/profile-images/1647777640",
                        outline: "",
                        animeId: 1,
                        director: "",
                        startAt: Date(),
                        weekNumber: 1
                    ),
                    anime: Anime(
                        id: 1,
                        title: "Anime Title",
                        origin: "test"
                    )
                )
                .frame(width: 320, height: 240)
            }
        }
    }
}

struct SeasonListView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonListView()
    }
}
