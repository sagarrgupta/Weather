//
//  HomeViewModel.swift
//  LocusWeather
//
//  Created by Sagar Gupta on 20/02/22.
//

import UIKit

/// view model class of home controller
class HomeViewModel {
    
    var cityWeatherDetails: CityWeather?
    
    /// used to get weather details from the api
    /// - Parameter cityName: pass city name to lookup **String**
    /// - Parameter completion: returns true if data is fetched else returns false
    func getWeatherDetails(cityName: String, completion: @escaping (Bool) -> Void) {
        let homeNetwork = HomeNetwork()
        homeNetwork.getService(cityName: cityName) { [weak self] succeeded, message, weatherDetails in
            guard let self = self, succeeded else {
                Helper.showAlert(head: nil, message: message.unwrap)
                completion(succeeded)
                return
            }
            self.cityWeatherDetails = weatherDetails
            completion(succeeded)
        }
    }
}
