//
//  File.swift
//  
//
//  Created by Fumiya Tanaka on 2022/06/25.
//

import Foundation

public struct Season: Codable, Identifiable {
    public init(id: Int, title: String, imageURL: String, outline: String, animeId: Int, director: String, startAt: Date, weekNumber: Int) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.outline = outline
        self.animeId = animeId
        self.director = director
        self.startAt = startAt
        self.weekNumber = weekNumber
    }

    public var id: Int
    public var title: String
    public var imageURL: String
    public var outline: String
    public var animeId: Int
    public var director: String
    public var startAt: Date
    public var weekNumber: Int

    public var dayLabel: String {
        let calendar = Calendar.current
        let day = calendar.component(.weekday, from: startAt)
        if day == 1 {
            return "日";
        } else if day == 2 {
            return "火";
        } else if day == 3 {
            return "水";
        } else if day == 4 {
            return "木";
        } else if day == 5 {
            return "金";
        } else if day == 6 {
            return "土";
        } else if day == 7 {
            return "日"
        }
        fatalError()
    }
}
