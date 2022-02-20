//
//  Home+Navigation.swift
//  LocusWeather
//
//  Created by Sagar Gupta on 20/02/22.
//

import UIKit

/// used to write navigation code
extension HomeViewController {
    
    /// used to navigate to selected weather list controller
    internal func navigateToWeatherListViewController() {
        guard let weatherListVC = UIStoryboard(name: "WeatherList", bundle: nil).instantiateViewController(withIdentifier: String(describing: WeatherListViewController.self)) as? WeatherListViewController else { return }
        weatherListVC.viewModel.cityWeatherDetails = viewModel.cityWeatherDetails
        self.navigationController?.pushViewController(weatherListVC, animated: true)
    }
}
