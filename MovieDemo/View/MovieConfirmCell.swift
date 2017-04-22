/*!
 @summary  Used in "MovieConfirmController"
 @detail   Show your basket info
 @author   Xiaoliang Guo
 */

import UIKit

class MovieConfirmCell: UITableViewCell {
    
    static let Height: CGFloat = 210.0
    
    let cost: CGFloat = 9.00
    
    // MARK: IBOutlet Properties
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var cinemaLabel: UILabel!
    @IBOutlet var dayTimeLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    @IBOutlet var qtyLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    
    // MARK: Life Cycle
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        cinemaLabel.text = nil
        dayTimeLabel.text = nil
        costLabel.text = nil
        qtyLabel.text = nil
        totalLabel.text = nil
    }
    
    // MARK: Public methods
    func setupData(movie: MovieBookModel) {
        titleLabel.text = movie.title
        cinemaLabel.text = movie.cinema
        dayTimeLabel.text = movie.dayTime
        costLabel.text = String.init(format: "COST：%.2f", cost)
        qtyLabel.text = String.init(format: "QTY：%d", movie.ticketCount!)
        totalLabel.text = String.init(format: "SUBTOTAL：%.2f", cost * CGFloat(movie.ticketCount!))
    }
}
