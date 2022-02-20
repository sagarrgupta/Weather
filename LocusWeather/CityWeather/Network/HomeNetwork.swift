//
//  HomeNetwork.swift
//  LocusWeather
//
//  Created by Sagar Gupta on 20/02/22.
//

import UIKit

/// network class of home controller
class HomeNetwork {
    let apiKey = "65d00499677e59496ca2f318eb68c049"
    
    /// used to call api to fetch data from the api
    /// - Parameter cityName: pass city name for which data to fetch **String**
    /// - Parameter completion: returns true with data if api succeeded else returns false with error message
    func getService(cityName: String, completion: @escaping (Bool, String?, CityWeather?) -> Void) {
        
        ApiManager.getRequest("https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)") { (jsonData) in
            
            guard let jsonData = jsonData, let status = jsonData["cod"] as? Int, status == 200 else {
                var msg: String?
                if let message = jsonData?["message"] as? String {
                    msg = message
                }
                completion(false, msg.unwrap, nil)
                print("#### GET CITY WEATHER DETAILS NETWORK ERROR ####")
                return
            }
            
            var weatherDetails: CityWeather?
            guard let encoder = try? JSONSerialization.data(fromDictionary: jsonData),
                  let weatherData = try? JSONDecoder().decode(CityWeather.self, from: encoder) else { return }
            weatherDetails = weatherData
            
            var msg: String?
            if let message = jsonData["message"] as? String {
                msg = message
            }
            completion(true, msg, weatherDetails)
            print("#### GET CITY WEATHER DETAILS NETWORK SUCCESS ####")
        } failure: { (error) in
            print("#### GET CITY WEATHER DETAILS NETWORK INVALID ####", error.localizedDescription)
            completion(false, "Unable to contact the server", nil)
        }
    }
}
