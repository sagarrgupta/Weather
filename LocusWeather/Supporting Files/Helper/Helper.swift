//
//  Helper.swift
//  LocusWeather
//
//  Created by Sagar Gupta on 20/02/22.
//

import UIKit

/// helper class to call global used functions
class Helper {
    
    /// used to show alert on controller
    /// - Parameters:
    ///   - head: pass title of the alert **String?**
    ///   - message: pass message to show **String**
    class func showAlert(head: String?, message: String) {
        let alert = UIAlertController(title: head, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        UIApplication.getTopMostViewController()?.present(alert, animated: true, completion: nil)
    }
    
    /// used to show toast
    /// - Parameter message: pass message to show **String**
    class func showToast(message: String) {
        guard let topMostViewController = UIApplication.getTopMostViewController()  else { return }
        let toastLabel = UILabel(frame: CGRect(x: 20, y: topMostViewController.view.frame.size.height - 300, width: topMostViewController.view.frame.size.width - 40, height: 35))
        toastLabel.backgroundColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 5
        toastLabel.clipsToBounds  =  true
        topMostViewController.view.addSubview(toastLabel)
        UIView.animate(withDuration: 2.0, delay: 2, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    /// used to show progress bar when api calling is in progress
    class func showPI(showLoader: Bool = true, showLabel: Bool = false, labelText: String = "") {
        let progress: LoadingProgress = LoadingProgress.shared
        progress.showPI(message: labelText, showLabel: showLabel, isLoaderEnable: showLoader)
    }
    
    /// used to hide progress bar when api calling is done
    class func hidePI() {
        LoadingProgress.shared._hide()
    }
    
    /// used to set table view or collection view background view
    /// - Parameters:
    ///   - tableView: pass tableview if going to set it **UITableView?**
    ///   - collectionView: pass tableview if going to set it **UICollectionView?**
    ///   - image: pass image to set **UIImage?**
    ///   - imageContentMode: pass content mode to set for image **UIView.ContentMode**
    ///   - labelText: pass text to show **String?**
    ///   - labelWithImage: pass true if want to show label **Bool**
    ///   - yPosition: pass y position to set **CGFloat**
    ///   - imageSize: pass image size to set **CGFloat**
    ///   - view: pass super view **UIView**
    class func setTableViewOrCollectionViewBackground(tableView: UITableView?, collectionView: UICollectionView?, image: UIImage?, imageContentMode: UIView.ContentMode = .scaleAspectFill, labelText: String?, labelWithImage: Bool, yPosition: CGFloat, imageSize: CGFloat = 100, view: UIView) {
        
        let backgroundView = UIView()
        backgroundView.frame = view.bounds
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
        
        let view = UIView()
        if let tempTableView = tableView {
            view.frame = tempTableView.frame
        }
        if let tempCollectionView = collectionView {
            view.frame = tempCollectionView.frame
        }
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: view.frame.width - 20, height: 200))
        
        if let image = image {
            imageView.image = image
            imageView.center.y = yPosition
            imageView.center.x = view.center.x
            imageView.contentMode = imageContentMode
            backgroundView.addSubview(imageView)
        }
        
        if let labelText = labelText {
            label.text = labelText
            label.numberOfLines = 0
            label.textAlignment = .center
            label.font = UIFont(name: ProductSans.Regular, size: 15)
            
            if labelWithImage {
                label.center.y = imageView.frame.maxY + 30
                imageView.center.x = view.center.x
                backgroundView.addSubview(label)
            } else {
                imageView.center.y = view.center.y
                imageView.center.x = view.center.x
                backgroundView.addSubview(label)
            }
        }
        
        if let tableView = tableView {
            tableView.backgroundView = backgroundView
        }
        
        if let collectionView = collectionView {
            collectionView.backgroundView = backgroundView
        }
    }
    
    /// used to set tableview header
    /// - Parameters:
    ///   - tableview: pass tableview view in which you want to add header **UITableView**
    ///   - viewColor: background color of view **UIColor**
    ///   - viewHeight: height of header **CGFloat**
    ///   - labelText: text of header you want to set **String**
    ///   - labelX: x position of label **CGFloat**
    ///   - labelFont: font of label to set **UIFont**
    ///   - labelTextColor: text color of text to set **UIColor**
    /// - Returns: returns view with label
    class func addTableViewHeader(tableview: UITableView, viewColor: UIColor? = .lightGray.withAlphaComponent(0.1), viewHeight: CGFloat = 44, labelText: String, labelX: CGFloat, labelFont: UIFont? = UIFont(name: ProductSans.Bold, size: 14), labelTextColor: UIColor?) -> UIView {
        
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: tableview.frame.width, height: viewHeight))
        customView.backgroundColor = viewColor
        
        let label = UILabel(frame: CGRect(x: labelX, y: 0, width: tableview.frame.width, height: viewHeight))
        label.text = labelText
        label.textColor = labelTextColor
        label.font = labelFont
        customView.addSubview(label)
        return customView
    }
}
