/*!
 @summary  Book movie
 @detail   Step three: confirm
 @author   Xiaoliang Guo
 */

import UIKit

class MovieConfirmController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // MARK: Properties
    let inputCellReusedID = "inputCell"
    let confirmCellReusedID = "confirmCell"
    var bookModel: MovieBookModel?
    var isAllInput = false
    var isCheck = false
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var movieTableView: UITableView!
    
    // MARK: TableView delegate and datasource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if 0 == indexPath.section { //Your basket
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieConfirmCell.reusedID)! as! MovieConfirmCell
            cell.setupData(movie: bookModel!)
            return cell
        } else if 1 == indexPath.section { //Personal details
            let cell = tableView.dequeueReusableCell(withIdentifier: inputCellReusedID)!
            return cell
        } else { //checkbox
            let cell = tableView.dequeueReusableCell(withIdentifier: confirmCellReusedID)!
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if 0 == indexPath.section {
            return MovieConfirmCell.Height
        } else if 1 == indexPath.section {
            return MovieConfirmInputCellHeight
        } else if 2 == indexPath.section {
            return MovieConfirmCheckCellHeight
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if 0 == section {
            return MovieBookStepView.bookStepView(step: .Confirm)
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if 0 == section {
            return MovieBookStepView.Height
        }
        return 0
    }
    
    // MARK: TextField delegate methods
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let nsStr = textField.text! as NSString
        let newStr = nsStr.replacingCharacters(in: range, with: string)
        let cell = movieTableView.cellForRow(at: IndexPath.init(row: 0, section: 1))
        if textField.tag == 100 {
            let textField0 = cell?.viewWithTag(200) as! UITextField
            let textField1 = cell?.viewWithTag(300) as! UITextField
            if newStr.characters.count > 0 && (textField0.text?.characters.count)! > 0 && (textField1.text?.characters.count)! > 0 {
                isAllInput = true
                if isCheck {
                    nextBtn.isEnabled = true
                } else {
                    nextBtn.isEnabled = false
                }
            } else {
                isAllInput = false
                nextBtn.isEnabled = false
            }
        } else if textField.tag == 200 {
            let textField0 = cell?.viewWithTag(100) as! UITextField
            let textField1 = cell?.viewWithTag(300) as! UITextField
            if newStr.characters.count > 0 && (textField0.text?.characters.count)! > 0 && (textField1.text?.characters.count)! > 0 {
                isAllInput = true
                if isCheck {
                    nextBtn.isEnabled = true
                } else {
                    nextBtn.isEnabled = false
                }
            } else {
                isAllInput = false
                nextBtn.isEnabled = false
            }
        } else if textField.tag == 300 {
            let textField0 = cell?.viewWithTag(100) as! UITextField
            let textField1 = cell?.viewWithTag(200) as! UITextField
            if newStr.characters.count > 0 && (textField0.text?.characters.count)! > 0 && (textField1.text?.characters.count)! > 0 {
                isAllInput = true
                if isCheck {
                    nextBtn.isEnabled = true
                } else {
                    nextBtn.isEnabled = false
                }
            } else {
                isAllInput = false
                nextBtn.isEnabled = false
            }
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        movieTableView.contentSize = CGSize.init(width: ScreenWidth, height: movieTableView.contentSize.height + 216)
        let point = textField.convert(CGPoint.zero, to: movieTableView)
        if movieTableView.contentOffset.y - point.y + 64 <= 0 {
            movieTableView.setContentOffset(CGPoint.init(x: 0, y: point.y - 64), animated: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.movieTableView.contentSize = CGSize.init(width: ScreenWidth, height: self.movieTableView.contentSize.height - 216)
        }
    }
    
    // MARK: Private methods
    @IBAction private func p_handleCancel(btn: UIButton) {
        let alert = UIAlertController.init(title: "ALERT", message: "Do You Cancel Order?", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "SURE", style: .destructive, handler: { (action) in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        alert.addAction(UIAlertAction.init(title: "CANCEL", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction private func p_handleCheck(btn: UIButton) {
        btn.isSelected = !btn.isSelected
        isCheck = btn.isSelected
        if btn.isSelected && isAllInput {
            nextBtn.isEnabled = true
        } else {
            nextBtn.isEnabled = false
        }
    }
}
