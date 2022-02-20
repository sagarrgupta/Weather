//
//  WeatherListViewController.swift
//  LocusWeather
//
//  Created by Sagar Gupta on 20/02/22.
//

import UIKit

/// controller to show available weather data
class WeatherListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setUI()
    }
    
    /// initial setup of the controller
    private func setup() {
        tableView.registerCell(tableViewCell: String(describing: WeatherListTableViewCell.self))
    }
    
    /// used to set ui of the screen
    private func setUI() {
        self.view.backgroundColor = AppBaseColor
        self.title = viewModel.cityWeatherDetails?.name.unwrap
    }
}
