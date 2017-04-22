/*!
 @summary  Book cell for movie
 @detail   Used in movie detail VC
 @author   Xiaoliang Guo
 */

import UIKit
import Kingfisher

class MovieBookCell: UITableViewCell {
    
    static let Height: CGFloat = 142.0
    
    // MARK: IBOutlet Properties
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var cinemaLabel: UILabel!
    @IBOutlet var dayTimeLabel: UILabel!
    
    // MARK: Life Cycle
    override func prepareForReuse() {
        super.prepareForReuse()
        imgView.image = nil
        titleLabel.text = nil
        cinemaLabel.text = nil
        dayTimeLabel.text = nil
    }
    
    // MARK: Public methods
    func setupData(movie: MovieBookModel) {
        imgView.kf.setImage(with: movie.imgUrl, placeholder: UIImage.init(named: "placeHolder"), options: nil, progressBlock: nil, completionHandler: nil)
        titleLabel.text = movie.title
        cinemaLabel.text = movie.cinema
        dayTimeLabel.text = movie.dayTime
    }
}
