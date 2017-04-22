/*!
 @summary  Convenient stuff
 @detail   Convenient stuff
 @author   Xiaoliang Guo
 */

import UIKit
import NVActivityIndicatorView

let AppDeleWindow = UIApplication.shared.delegate?.window

class MovieHelper {
    
    static let indicatorView = NVActivityIndicatorView(frame: CGRect.init(x: (ScreenWidth - 50) / 2, y: (ScreenHeight - 50) / 2, width: 50, height: 50), type: nil, color: .black, padding: nil)
    
    //Show loading
    class func showLoadingView() {
        AppDeleWindow??.addSubview(indicatorView)
        indicatorView.startAnimating()
    }
    
    //Hidden loading
    class func hiddenLoadingView() {
        indicatorView.stopAnimating()
        indicatorView.removeFromSuperview()
    }
    
    class func getImageUrl(path: String) -> URL? {
        return URL.init(string: "https://image.tmdb.org/t/p/w150" + path)
    }
}

extension UITableViewCell {
    class var reusedID: String {
        get {
            return String(describing: self)
        }
    }
}

extension UIView {
    class var xibName: String {
        get {
            return String(describing: self)
        }
    }
}

extension UIColor {
    
    class func color(seatType: MovieSeatType) -> Self {
        return self.color(value: seatType.rawValue)
    }
    
    class func color(value: UInt32) -> Self {
        let red   = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((value & 0xFF00) >> 8) / 255.0
        let blue  = CGFloat((value & 0xFF)) / 255.0
        let alpha = CGFloat(1)
        return self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    class func color(value: UInt32, alpha: CGFloat) -> Self {
        let red   = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((value & 0xFF00) >> 8) / 255.0
        let blue  = CGFloat((value & 0xFF)) / 255.0
        return self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}







