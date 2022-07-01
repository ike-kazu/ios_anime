//
//  RootView.swift
//  AnimeiOSApp
//
//  Created by Fumiya Tanaka on 2022/06/24.
//

import SwiftUI
import Domain
import SFSafeSymbols

struct RootView: View {

    @Binding var isLoggedIn: Bool
    @Environment(\.apiClient) var apiClient: APIClient

    var body: some View {
        if isLoggedIn {
            TabView {
                AnimeListView(
                    state: AnimeListState(apiClient: apiClient)
                ).tabItem {
                    Image(systemSymbol: .tablecells)
                    Text("テーブル")
                }
                
            }
        } else {
            LoginView(state: LoginState(apiClient: apiClient))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(isLoggedIn: .constant(true))
    }
}
