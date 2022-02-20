//
//  LoadingProgress.swift
//  LocusWeather
//
//  Created by Sagar Gupta on 20/02/22.
//

import UIKit

/// used to loader while calling api
class LoadingProgress: UIView {
    
    @IBOutlet weak var progressImage: UIImageView!
    @IBOutlet weak var loadingHead: UILabel!
    
    private static var obj: LoadingProgress? = nil
    static var flagClose = false
    
    static var shared: LoadingProgress {
        if obj == nil {
            obj = UINib(nibName: "LoadingProgress", bundle: Bundle.main).instantiate(withOwner: nil, options: nil)[0] as? LoadingProgress
            obj?.frame = UIScreen.main.bounds
        }
        return obj!
    }
    
    /// initial set up of the view
    private func setup() {
        DispatchQueue.main.async {
            self.loadingHead.textColor = .black
            self.loadingHead.font = UIFont(name: ProductSans.Regular, size: 15)
            if let window: UIWindow = UIApplication.shared.currentWindow {
                window.windowLevel = UIWindow.Level.alert
                window.addSubview(self)
                self.transform = CGAffineTransform.identity.scaledBy(x: 0.0, y: 0.0)
                
                UIView.animate(withDuration: 0.01, delay: 0.01, options: .beginFromCurrentState, animations: {() -> Void in
                    self.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
                }, completion: {(_ finished: Bool) -> Void in
                })
            }
        }
    }
    
    /// used to show loader
    /// - Parameters:
    ///   - message: pass message to show if any **String**
    ///   - showLabel: pass true if have to show label **Bool**
    ///   - isLoaderEnable: pass true if want to show loader **Bool**
    func showPI(message: String, showLabel: Bool, isLoaderEnable: Bool) {
        setup()
        DispatchQueue.main.async {
            self.loadingHead.text = message
            let gif = UIImage.gifImageWithName("loading_orange")
            self.progressImage.image = gif
            self.loadingHead.isHidden = !showLabel
            self.isHidden = !isLoaderEnable
        }
        
        let when = DispatchTime.now() + 30
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
            UIView.animate(withDuration: 0.01, delay: 0.01, options: .beginFromCurrentState, animations: {() -> Void in
                self.transform = CGAffineTransform.identity.scaledBy(x: 0.0, y: 0.0)
            }, completion: {(_ finished: Bool) -> Void in
                if (LoadingProgress.obj != nil) {
                    self.removeFromSuperview()
                }
            })
        }
    }
    
    /// used to hide loader
    func _hide() {
        if (LoadingProgress.obj != nil) {
            DispatchQueue.main.async {
                self.removeFromSuperview()
            }
        }
    }
    
    /// used to set label text
    /// - Parameter text: pass text to set **String**
    private func setLabel(text: String) {
        loadingHead.text = text
    }
}

