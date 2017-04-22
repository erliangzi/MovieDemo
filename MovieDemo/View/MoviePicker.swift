/*!
 @summary  Wrap UIPickerView with xib file
 @detail   Used select cinema, day, time, ticket's count
 @author   Xiaoliang Guo
 */

import UIKit

class MoviePicker: UIView {
    
    @IBOutlet var titleLabel: UILabel!
    
    // MARK: Convenient init method
    class func picker(type: MoviePickerType, target: Any) -> MoviePicker {
        let picker = Bundle.main.loadNibNamed(MoviePicker.xibName, owner: target, options: nil)?[0] as! MoviePicker
        picker.titleLabel.text = type.rawValue
        return picker
    }
}
