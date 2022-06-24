//
//  LoginState.swift
//  AnimeiOSApp
//
//  Created by Fumiya Tanaka on 2022/06/24.
//

import Foundation
import Domain

class LoginState: ObservableObject {
    @Published var twitterAccessToken: String?

    private let model: LoginModel

    init(model: LoginModel) {
        self.model = model
    }
}
