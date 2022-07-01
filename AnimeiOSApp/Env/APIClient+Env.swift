//
//  APIClient+Env.swift
//  AnimeiOSApp
//
//  Created by Fumiya Tanaka on 2022/06/29.
//

import Foundation
import Domain
import SwiftUI

struct EnvAPIClientKey: EnvironmentKey {
    static var defaultValue: APIClient = APIClientStub()
}

extension EnvironmentValues {
    var apiClient: APIClient {
        get {
            self[EnvAPIClientKey.self]
        }
        set {
            self[EnvAPIClientKey.self] = newValue
        }
    }
}
