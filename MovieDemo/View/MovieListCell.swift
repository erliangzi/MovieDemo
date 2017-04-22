/*!
 @summary  List cell for movie
 @detail   Used in movie list VC
 @author   Xiaoliang Guo
 */

import UIKit
import Kingfisher

class MovieListCell: UITableViewCell {
    
    static let Height: CGFloat = 142.0
    
    // MARK: IBOutlet Properties
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var popularityLabel: UILabel!
    
    // MARK: Life Cycle
    override func prepareForReuse() {
        super.prepareForReuse()
        imgView.image = nil
        titleLabel.text = ""
        popularityLabel.text = ""
    }
    
    // MARK: Public methods
    func setupData(movie: MovieBriefModel) {
        imgView.kf.setImage(with: movie.posterUrl, placeholder: UIImage.init(named: "placeHolder"), options: nil, progressBlock: nil, completionHandler: nil)
        titleLabel.text = movie.title
        popularityLabel.text = String.init(format: "Popularity：%.2f", movie.popularity!)
    }
}
