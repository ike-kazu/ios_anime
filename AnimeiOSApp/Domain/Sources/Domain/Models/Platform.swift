//
//  Platform.swift
//  
//
//  Created by Fumiya Tanaka on 2022/06/25.
//

import Foundation

public struct Platform: Codable, Identifiable {
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }

    public var id: Int
    public var name: String

}
