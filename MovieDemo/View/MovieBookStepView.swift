/*!
 @summary  Book step view
 @detail   Four steps:1.select seats
                      2.select tickets
                      3.comfirm
                      4.successful
 @author   Xiaoliang Guo
 */

import Foundation
import UIKit

enum BookStep: Int {
    case SelectSeats = 0
    case SelectTickets
    case Confirm
    case Successful
}

class MovieBookStepView: UIView {
    
    // MARK: Properties
    static let Height: CGFloat = 70.0
    @IBOutlet var numArr: [UILabel]!
    @IBOutlet var tipArr: [UILabel]!
    
    // MARK: Convenient init method
    class func bookStepView(step: BookStep) -> MovieBookStepView {
        let bookStepView = Bundle.main.loadNibNamed(MovieBookStepView.xibName, owner: nil, options: nil)?[0] as! MovieBookStepView
        bookStepView.frame.size = CGSize.init(width: ScreenWidth, height: bookStepView.frame.size.height)
        for i in 0...step.rawValue {
            bookStepView.numArr[i].backgroundColor = UIColor.color(value: 0x007AFF)
            bookStepView.tipArr[i].textColor = UIColor.color(value: 0x007AFF)
        }
        return bookStepView
    }
}
