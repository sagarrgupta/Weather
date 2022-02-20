//
//  Extension.swift
//  LocusWeather
//
//  Created by Sagar Gupta on 20/02/22.
//

import UIKit

/// used to write extension of different classes
// MARK: - UIApplication -
extension UIApplication {
    
    /// used to get active ui window as after iOS 13 there is not particular one window there are multiple windows
    /// usage: UIApplication.shared.currentWindow?.rootViewController
    var currentWindow: UIWindow? {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.filter { $0.isKeyWindow }.first
    }
    
    /// used to get top most controller
    /// - Parameter base: pass base controller if want to specify **UIViewController?**
    /// - Returns: returns top most controller **UIViewController?**
    class func getTopMostViewController(base: UIViewController? = UIApplication.shared.currentWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopMostViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return getTopMostViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return getTopMostViewController(base: presented)
        }
        return base
    }
}

// MARK: - JSONSerialization -
extension JSONSerialization {
    
    public typealias JSONDictionary = [String: Any]
    
    public typealias ArrayOfDictionary = [[String: Any]]
    
    /// Converts `JSONDictionary` into `Data`.
    /// - Parameter dictionary: Object of `JsonDictionary`, Type can be **JSONDictionary** or **nil**
    public static func data(fromDictionary dictionary: JSONDictionary?) throws -> Data? {
        guard let data = dictionary else { return nil }
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted) else {
            return nil
        }
        return jsonData
    }
    
    /// Converts `ArrayOfDictionary` into `Data`.
    /// - Parameter dictionary: Object of `ArrayOfDictionary`, Type can be **JSONDictionary** or **nil**
    public static func data(fromArrayOfDictionary ArrayOfDictionary: ArrayOfDictionary?) throws -> Data? {
        guard let data = ArrayOfDictionary else { return nil }
        return try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
    }
}

// MARK: - UITableView -
extension UITableView {
    
    /// function is used to register any custom UITableViewCell in any UITableView
    func registerCell(tableViewCell: String) {
        register(UINib(nibName: tableViewCell, bundle: nil), forCellReuseIdentifier: tableViewCell)
    }
}

// MARK: - UIView -
extension UIView {
    
    /// used to get rounded corners of button
    func roundCorners(_ cornerRadius: CGFloat? = nil, clipToBounds: Bool = true) {
        cornerRadius == nil ? (self.layer.cornerRadius = self.frame.height / 2): (self.layer.cornerRadius = cornerRadius ?? 0)
        self.clipsToBounds = clipToBounds
    }
    
    /// add shadow to view
    /// - Parameters:
    ///   - color: what type of color you want **UIColor**
    ///   - opacity: opacity of shadow, default is 0.3 **Float**
    ///   - radius: how far you want to make your shadow visible, default is 10 **CGFloat**
    ///   - shadowOffset: offset for shadow **CGFloat**
    func addShadowToView(_ color: UIColor, opacity: Float = 0.3, radius: CGFloat = 1.0, shadowOffset: CGSize = CGSize(width: 3, height: 3)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.layer.masksToBounds = false
            self.layer.shadowColor = color.cgColor
            self.layer.shadowOpacity = opacity
            self.layer.shadowOffset = shadowOffset
            self.layer.shadowRadius = radius
            
            self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = UIScreen.main.scale
        }
    }
}

// MARK: - Optional String -
extension Optional where Wrapped == String {
  var unwrap: String {
    return self ?? ""
  }
}

// MARK: - Optional Int -
extension Optional where Wrapped == Int {
  var unwrap: Int {
    return self ?? 0
  }
}

// MARK: - Optional Double -
extension Optional where Wrapped == Double {
  var unwrap: Double {
      return self ?? 0.0
  }
}
