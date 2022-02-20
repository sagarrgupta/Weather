//
//  HomeViewController.swift
//  LocusWeather
//
//  Created by Sagar Gupta on 20/02/22.
//

import UIKit

/// controller of home screen
class HomeViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var lookupButton: UIButton!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setUI()
    }
    
    /// initial setup of the controller
    private func setup() {
    }
    
    /// used to set ui of the controller
    private func setUI() {
        self.view.backgroundColor = AppBaseColor
        
        textField.tintColor = .black
        textField.placeholder = "Enter city name"
        
        lookupButton.setTitle("Lookup", for: .normal)
        lookupButton.setTitleColor(.black, for: .normal)
        lookupButton.layer.borderColor = UIColor.black.cgColor
        lookupButton.layer.borderWidth = 1
        lookupButton.roundCorners(5)
    }
    
    @IBAction func lookupButtonAction(_ sender: Any) {
        self.view.endEditing(true)
        guard let city = textField.text, !city.isEmpty else {
            Helper.showToast(message: "Please enter city name")
            return
        }
        getData()
    }
    
    /// used to call api to get data from api
    private func getData() {
        viewModel.getWeatherDetails(cityName: textField.text.unwrap) { [weak self] succeeded in
            guard let self = self, succeeded else { return }
            self.textField.text = nil
            self.navigateToWeatherListViewController()
        }
    }
}

