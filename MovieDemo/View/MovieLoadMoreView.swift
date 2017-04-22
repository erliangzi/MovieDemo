/*!
 @summary  Load more data for scrollView
 @detail   drag up to load more data for scrollView
 @author   Xiaoliang Guo
 */

import UIKit

class MovieLoadMoreView: UIView {
    
    // MARK: Properties
    static let Height: CGFloat = 44.0
    static let Margin: CGFloat = 20.0
    let indicatorView = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)
    let tipLabel = UILabel.init(frame: CGRect.init(x: Margin * 3, y: Margin / 2, width: 300, height: 24))
    
    // MARK: Convenient init method
    class func loadMoreView() -> MovieLoadMoreView {
        let loadMoreView = MovieLoadMoreView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: Height))
        loadMoreView.indicatorView.frame.origin = CGPoint.init(x: Margin, y: (loadMoreView.frame.size.height - loadMoreView.indicatorView.frame.size.height) / 2)
        loadMoreView.addSubview(loadMoreView.indicatorView)
        loadMoreView.tipLabel.text = "is loading more..."
        loadMoreView.addSubview(loadMoreView.tipLabel)
        return loadMoreView
    }
}
