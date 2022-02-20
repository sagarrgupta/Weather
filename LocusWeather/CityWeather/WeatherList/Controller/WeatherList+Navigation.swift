//
//  WeatherList+Navigation.swift
//  LocusWeather
//
//  Created by Sagar Gupta on 20/02/22.
//

import UIKit

/// used to write navigation code
extension WeatherListViewController {
    
    /// used to navigate to selected weather details controller
    /// - Parameter weather: pass selected weather **Weather**
    internal func navigateToWeatherDetailsViewController(weather: Weather) {
        guard let weatherDetailsVC = UIStoryboard(name: "WeatherDetails", bundle: nil).instantiateViewController(withIdentifier: String(describing: WeatherDetailsViewController.self)) as? WeatherDetailsViewController else { return }
        weatherDetailsVC.viewModel.cityWeatherDetails = viewModel.cityWeatherDetails
        weatherDetailsVC.viewModel.weatherDetails = weather
        self.navigationController?.pushViewController(weatherDetailsVC, animated: true)
    }
}
