/*!
 @summary  Detail cell for movie
 @detail   Used in movie detail VC
 @author   Xiaoliang Guo
 */

import UIKit

class MovieDetailCell: MovieListCell {
    
    // MARK: IBOutlet Properties
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var genresLabel: UILabel!
    @IBOutlet var languagesLabel: UILabel!
    @IBOutlet var runtimeLabel: UILabel!
    
    // MARK: Life Cycle
    override func prepareForReuse() {
        super.prepareForReuse()
        overviewLabel.text = ""
        genresLabel.text = ""
        languagesLabel.text = ""
        runtimeLabel.text = ""
    }
    
    // MARK: Public methods
    override func setupData(movie: MovieBriefModel) {
        super.setupData(movie: movie)
        if let detailMovie = movie as? MovieDetailModel {
            overviewLabel.text = detailMovie.overview
            genresLabel.text = detailMovie.genre
            languagesLabel.text = detailMovie.language
            runtimeLabel.text = String(detailMovie.runtime!) + "min"
        }
    }
}
