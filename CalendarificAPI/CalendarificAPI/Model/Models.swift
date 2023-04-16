//
//  Models.swift
//  CalendarificAPI
//
//  Created by BerkH on 16.04.2023.
//

import Foundation

struct HolidayResponse: Codable {
    let response: Response
}

struct Response: Codable {
    var holidays: [Holiday]
}

struct Holiday: Codable {
    let name: String
    let description: String
    let country: Country
    let date: DateInfo
    let type: [String]
}

struct Country: Codable {
    let id: String
    let name: String
}

struct DateInfo: Codable {
    let iso: String
    let datetime: DatetimeInfo
}

struct DatetimeInfo: Codable {
    let year: Int
    let month: Int
    let day: Int
}

struct ApiSections {
    let api_key = "4db599337a3ee61ea55508ef6ec5da30ac03f68b"
    let country = "TR"
    let year = "2023"
}
