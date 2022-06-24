//
//  RootView.swift
//  AnimeiOSApp
//
//  Created by Fumiya Tanaka on 2022/06/24.
//

import SwiftUI
import Domain

struct RootView: View {

    @Binding var isLoggedIn: Bool

    var body: some View {
        if isLoggedIn {
            AnimeListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(isLoggedIn: .constant(true))
    }
}
