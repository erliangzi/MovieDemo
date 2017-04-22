/*!
 @summary  Book movie
 @detail   Step two: Select tickets
 @author   Xiaoliang Guo
 */

import UIKit

class MovieSelectTicketController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    let tipCellReusedID = "tipCell"
    let selectCellReusedID = "selectCell"
    var bookModel: MovieBookModel?
    var selectCount: UInt8 = 0
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var pickerManager: MoviePickerManager!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerManager.ticketCount = bookModel?.ticketCount
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIDToConfirm {
            let detail = segue.destination as! MovieConfirmController
            bookModel?.ticketCount = selectCount
            detail.bookModel = bookModel
        }
    }
    
    // MARK: TableView delegate and datasource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (0 == section) ? 1 : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if 0 == indexPath.section { //MovieBookCell
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieBookCell.reusedID)! as! MovieBookCell
            cell.setupData(movie: bookModel!)
            return cell
        } else {
            if 0 == indexPath.row { //tipCell
                let cell = tableView.dequeueReusableCell(withIdentifier: tipCellReusedID)!
                return cell
            } else { //selectCell
                let cell = tableView.dequeueReusableCell(withIdentifier: selectCellReusedID)!
                cell.textLabel?.text = MoviePickerType.SelectTicketCount.rawValue
                cell.detailTextLabel?.text = "0/" + String((bookModel?.ticketCount)!)
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if 1 == indexPath.section && 1 == indexPath.row {
            pickerManager.showPicker(type: .SelectTicketCount, callback: { [weak self] (count) in
                self?.selectCount = UInt8(count)!
                let selectCell = tableView.cellForRow(at: indexPath)
                selectCell?.detailTextLabel?.text = String(count) + "/" + String((self?.bookModel?.ticketCount)!)
                selectCell?.detailTextLabel?.textColor = .black
                if !(self?.nextBtn.isEnabled)! {
                    self?.nextBtn.isEnabled = true
                }
            })
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if 0 == indexPath.section {
            return MovieBookCell.Height
        } else if 1 == indexPath.section {
            if 0 == indexPath.row {
                return MovieTicketsTipsViewHeight
            } else if 1 == indexPath.row {
                return NormalCellHeight
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if 0 == section {
            return MovieBookStepView.bookStepView(step: .SelectTickets)
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if 0 == section {
            return MovieBookStepView.Height
        }
        return 0
    }
}
