//
//  WeatherList+TableView.swift
//  LocusWeather
//
//  Created by Sagar Gupta on 20/02/22.
//

import UIKit

/// used to conform table view datasource and delegates
extension WeatherListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cityWeatherDetails?.weather?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let weatherData = viewModel.cityWeatherDetails, let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WeatherListTableViewCell.self), for: indexPath) as? WeatherListTableViewCell else { return UITableViewCell() }
        cell.configureCell(cityWeatherData: weatherData, row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let weatherData = viewModel.cityWeatherDetails?.weather?[indexPath.row] else { return }
        navigateToWeatherDetailsViewController(weather: weatherData)
    }
}
