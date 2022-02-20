//
//  WeatherDetailsViewController.swift
//  LocusWeather
//
//  Created by Sagar Gupta on 20/02/22.
//

import UIKit

/// screen to detailed weather data
class WeatherDetailsViewController: UIViewController {

    @IBOutlet weak var labelStackView: UIStackView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subHeaderLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    let viewModel = WeatherDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setUI()
    }
    
    /// initial setup of the controller
    private func setup() {
        setData()
    }
    
    /// used to set ui of the screen
    private func setUI() {
        self.view.backgroundColor = AppBaseColor
        self.title = viewModel.cityWeatherDetails?.name.unwrap
        headerLabel.font = .systemFont(ofSize: 40)
        subHeaderLabel.font = .systemFont(ofSize: 18)
        titleLabel.font = .systemFont(ofSize: 22)
        subtitleLabel.font = .systemFont(ofSize: 18)
    }
    
    /// used to set data in labels
    private func setData() {
        headerLabel.text = "\(Int(viewModel.cityWeatherDetails?.metaData?.temp ?? 0))"
        subHeaderLabel.text = "Feels like: \(Int(viewModel.cityWeatherDetails?.metaData?.feelsLike ?? 0))"
        titleLabel.text = viewModel.weatherDetails?.title.unwrap
        subtitleLabel.text = viewModel.weatherDetails?.weatherDescription.unwrap
    }
}
