//
//  CityWeather.swift
//  LocusWeather
//
//  Created by Sagar Gupta on 20/02/22.
//

import UIKit

/// used to save weather details of city
// MARK: - CityWeather -
struct CityWeather: Codable {
    var coordinates: Coordinates?
    var weather: [Weather]?
    var base: String?
    var metaData: MetaData?
    var visibility: Int?
    var wind: Wind?
    var clouds: Clouds?
    var timeStamp: Int?
    var dayDetails: DayDetails?
    var timezone, id: Int?
    var name: String?
    var cod: Int?
    
    enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case weather
        case base
        case metaData = "main"
        case visibility, wind, clouds
        case timeStamp = "dt"
        case dayDetails = "sys"
        case timezone, id, name, cod
    }
}

// MARK: - Coordinates -
struct Coordinates: Codable {
    var lon, lat: Double?
}

// MARK: - Weather -
struct Weather: Codable {
    var id: Int?
    var title, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title = "main"
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - MetaData -
struct MetaData: Codable {
    var temp, feelsLike, tempMin, tempMax: Double?
    var pressure, humidity, seaLevel, groundLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
    }
}

// MARK: - Wind -
struct Wind: Codable {
    var speed: Double?
    var deg: Int?
    var gust: Double?
}

// MARK: - Clouds -
struct Clouds: Codable {
    var all: Int?
}

// MARK: - DayDetails -
struct DayDetails: Codable {
    var country: String?
    var sunrise, sunset: Int?
}

let AppBaseColor: UIColor = .lightGray
