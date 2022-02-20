//
//  ApiManager.swift
//  LocusWeather
//
//  Created by Sagar Gupta on 20/02/22.
//

import UIKit
import Alamofire

/// used to do network call
class ApiManager {
    
    /// used to call api when it is of get type
    /// - Parameters:
    ///   - strURL: url of the api **String**
    ///   - showLoader: pass true if you want to show loading symbol **Bool**,default is true
    ///   - showLoaderLabel: pass true if you want to show loader label **Bool**,default is false
    ///   - loaderText: pass text which you want to show when loader is being shown **String**
    ///   - params: pass parameters you want to send in api
    ///   - header: pass header you want to send in api **HTTPHeaders**, default is APIUtility.getHeaderForPost()
    ///   - success: returns when api call has been succeeded
    ///   - failure: returns when api call has been failed
    class func getRequest(_ strURL: String, showLoader: Bool = true, showLoaderLabel: Bool = false, loaderText: String = "Loading", header: HTTPHeaders? = nil, success: @escaping ([String: Any]?) -> Void, failure: @escaping (Error) -> Void) {
        
        Helper.showPI(showLoader: showLoader, showLabel: showLoaderLabel, labelText: loaderText)
        
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        manager.request(strURL, headers: header).responseJSON { (responseObject) -> Void in
            
            Helper.hidePI()
            
            switch responseObject.result {
            case let .success(value):
                if let statusCode = responseObject.response?.statusCode {
                    print("STATUS CODE FROM API MANAGER GET METHOD: \(statusCode)")
                }
                guard let data = value as? [String: Any] else { return }
                success(data)
                
            case let .failure(error):
                let error: Error = error
                if let statusCode = responseObject.response?.statusCode {
                    print("ERROR STATUS CODE FROM API MANAGER GET METHOD: \(statusCode)")
                }
                failure(error)
            }
        }
    }
}
