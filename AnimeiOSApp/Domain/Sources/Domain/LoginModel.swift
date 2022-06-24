//
//  File.swift
//  
//
//  Created by Fumiya Tanaka on 2022/06/24.
//

import Foundation

public protocol LoginModel {
    func login() async throws
}

public class LoginModelImpl: LoginModel {

    public init() {
        
    }

    public func login() async throws {

    }
}
