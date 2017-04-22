/*!
 @summary  Payment
 @detail   Payment
 @author   Xiaoliang Guo
 */

import UIKit

class MoviePaymentController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    var payType: PayType = .Visa
    @IBOutlet var payBtn: UIButton!
    @IBOutlet var cnTextField: UITextField!
    @IBOutlet var monthTextField: UITextField!
    @IBOutlet var yearTextField: UITextField!
    @IBOutlet var scTextField: UITextField!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = payType.rawValue
    }
    
    // MARK: TextField delegate methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (cnTextField.text?.characters.count)! > 0 &&
            (monthTextField.text?.characters.count)! > 0 &&
            (yearTextField.text?.characters.count)! > 0 &&
            (scTextField.text?.characters.count)! > 0 {
            payBtn.isEnabled = true
        } else {
            payBtn.isEnabled = false
        }
        return true
    }

}
