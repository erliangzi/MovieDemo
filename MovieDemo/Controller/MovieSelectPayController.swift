/*!
 @summary  Select Pay
 @detail   Visa, masterCard
 @author   Xiaoliang Guo
 */

import UIKit

class MovieSelectPayController: UIViewController {

    var payType = PayType.Visa
    
    // MARK: Life cycle
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIDToPay {
            let des = segue.destination as! MoviePaymentController
            des.payType = payType
        }
    }

    // MARK: Private methods
    @IBAction private func handlePay(_ sender: UITapGestureRecognizer) {
        payType = (sender.view?.tag == 0) ? .Visa : .MasterCard
        performSegue(withIdentifier: SegueIDToPay, sender: self)
    }
}
