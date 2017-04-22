/*!
 @summary  Book movie
 @detail   Step one: Select seats
 @author   Xiaoliang Guo
 */

import UIKit

class MovieSelectSeatController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    let seatTypeCellReusedID = "seatTypeCell"
    let movieSeatViewXibName = "MovieSeatView"
    var bookModel: MovieBookModel?
    @IBOutlet var nextBtn: UIButton!
    
    // MARK: Life cycle
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIDToSelectTicket {
            let detail = segue.destination as! MovieSelectTicketController
            detail.bookModel = bookModel
        }
    }
    
    // MARK: TableView delegate and datasource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if 0 == section {
            return 1
        } else if 1 == section {
            return 2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if 0 == indexPath.section { //MovieBookCell
            let cell = tableView.dequeueReusableCell(withIdentifier:MovieBookCell.reusedID)! as! MovieBookCell
            cell.setupData(movie: bookModel!)
            return cell
        } else {
            if 0 == indexPath.row { //MovieSeatView
                let cell = tableView.dequeueReusableCell(withIdentifier: seatTypeCellReusedID)!
                let seatView = Bundle.main.loadNibNamed(movieSeatViewXibName, owner: nil, options: nil)?[0] as? UIView
                seatView?.frame.size = CGSize.init(width: ScreenWidth, height: (seatView?.frame.size.height)!)
                cell.contentView.addSubview(seatView!)
                return cell
            } else { //MovieSelectSeatCell
                let cell = tableView.dequeueReusableCell(withIdentifier: MovieSelectSeatCell.reusedID) as! MovieSelectSeatCell
                //select or cancel select callback
                cell.callback = { [weak self] (isSelect, index) -> () in
                    if isSelect {
                        self?.bookModel?.ticketCount = (self?.bookModel?.ticketCount)! + 1
                    } else {
                        self?.bookModel?.ticketCount = (self?.bookModel?.ticketCount)! - 1
                    }
                    if (self?.bookModel?.ticketCount)! > 0 {
                        self?.nextBtn.isEnabled = true
                    } else {
                        self?.nextBtn.isEnabled = false
                    }
                }
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if 0 == indexPath.section {
            return MovieBookCell.Height
        } else if 1 == indexPath.section {
            if 0 == indexPath.row {
                return MovieSeatViewHeight
            } else if 1 == indexPath.row {
                return MovieSelectSeatViewHeight
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if 0 == section {
            return MovieBookStepView.bookStepView(step: .SelectSeats)
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
    



    
    


