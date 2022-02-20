//
//  WeatherListTableViewCell.swift
//  LocusWeather
//
//  Created by Sagar Gupta on 20/02/22.
//

import UIKit

/// table view cell of weather list controller
class WeatherListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    /// initial setup of the cell
    private func setUI() {
        self.backgroundColor = .clear
    }
    
    /// used to configure cell
    /// - Parameter cityWeatherData: pass weather data to show **CityWeather**
    /// - Parameter row: pass row for the data to show **Int**
    func configureCell(cityWeatherData: CityWeather, row: Int) {
        titleLabel.text = cityWeatherData.weather?[row].title
        subtitleLabel.text = "temp: \(Int(cityWeatherData.metaData?.temp ?? 0.0))"
    }
}
