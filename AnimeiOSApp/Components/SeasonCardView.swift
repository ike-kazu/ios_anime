//
//  SeasonCardView.swift
//  AnimeiOSApp
//
//  Created by Fumiya Tanaka on 2022/06/25.
//

import Foundation
import StubKit
import SwiftUI
import Domain

public struct SeasonCardView: View {

    public let season: Season
    public let anime: Anime

    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                AsyncImage(url: URL(string: season.imageURL)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width, height: proxy.size.height)
                            .cornerRadius(16)
                    case .empty:
                        ProgressView()
                            .progressViewStyle(.circular)
                    case .failure:
                        EmptyView()
                    @unknown default:
                        fatalError()
                    }
                }

                VStack(alignment: .leading) {
                    Text(anime.title)
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(16, corners: [.topRight, .bottomRight])
                    Spacer()
                    Text(season.startAt.display)
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(16, corners: [.topLeft, .bottomLeft])
                        .alignmentGuide(.leading) { d in
                            -proxy.size.width + d.width
                        }
                }
                .padding(.vertical)
            }
        }
        .cornerRadius(16)
    }
}

struct SeasonCardView_Preview: PreviewProvider {
    static var previews: some View {
        SeasonCardView(
            season: try! Stub.make(Season.self),
            anime: try! Stub.make(Anime.self)
        )
        .previewLayout(.fixed(width: 320, height: 240))
    }
}
