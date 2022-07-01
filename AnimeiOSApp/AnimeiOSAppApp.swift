//
//  AnimeiOSAppApp.swift
//  AnimeiOSApp
//
//  Created by Fumiya Tanaka on 2022/06/24.
//

import SwiftUI
import Domain

@main
struct AnimeiOSAppApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(isLoggedIn: .constant(true))
        }
    }
}
