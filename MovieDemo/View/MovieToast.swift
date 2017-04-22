/*!
 @summary  show toast
 @detail   show toast
 @author   Xiaoliang Guo
 */

import UIKit

let ToastMargin: CGFloat = 30.0

class MovieToast: UIWindow {
    
    // MARK: Single instance
    static let shared = MovieToast.init(frame: UIScreen.main.bounds)
    
    // MARK: Lazy properties
    lazy var bgView: UIView = {
        let aView = UIView.init(frame: CGRect.zero)
        aView.backgroundColor = UIColor.color(value: 0x000000, alpha: 0.8)
        aView.layer.cornerRadius = 4
        aView.layer.masksToBounds = true
        return aView
    }()
    lazy var textLabel: UILabel = {
        let aLabel = UILabel.init(frame: CGRect.zero)
        aLabel.textAlignment = .center
        aLabel.numberOfLines = 0
        aLabel.font = UIFont.systemFont(ofSize: 14)
        aLabel.textColor = .white
        return aLabel
    }()
    
    // MARK: init method
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(bgView)
        bgView.addSubview(textLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Convenient method
    class func showToast(text: String) {
        shared.backgroundColor = .clear
        shared.isHidden = false
        let textStr = text as NSString
        let rect = textStr.boundingRect(with: CGSize.init(width: ScreenWidth - 50, height: 1000), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 14)], context: nil)
        //Setup frame, text----------------------------
        shared.bgView.frame.size = CGSize.init(width: rect.size.width + ToastMargin, height: rect.size.height + ToastMargin)
        shared.bgView.center = shared.center
        shared.textLabel.frame.size = rect.size
        shared.textLabel.center = CGPoint.init(x: shared.bgView.frame.size.width / 2, y: shared.bgView.frame.size.height / 2)
        shared.textLabel.text = text
        //Setup frame, text----------------------------
        
        //Show toast
        shared.windowLevel = 100
        
        //Auto dismiss
        shared.perform(#selector(handleDismiss), with: nil, afterDelay: 3)
    }
    
    // MARK: Life cycle
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.windowLevel = -100
    }
    
    // MARK: Private methods
    @objc private func handleDismiss() {
        MovieToast.cancelPreviousPerformRequests(withTarget: MovieToast.shared)
        self.windowLevel = -100
    }
}
