/*!
@summary  Select Pay
@detail   Visa, masterCard
@author   Xiaoliang Guo
*/

import UIKit

class MovieBookSuccessfulController: UIViewController {

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let stepView = MovieBookStepView.bookStepView(step: .Successful)
        stepView.frame.origin = CGPoint.init(x: 0, y: 64)
        view.addSubview(stepView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MovieToast.showToast(text: "BOOK SUCCEED")
    }
    
    // MARK: Private methods
    @IBAction private func handlePopToRoot(btn: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
