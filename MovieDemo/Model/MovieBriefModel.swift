/*!
 @summary  Brief model for movie
 @detail   Used in movie list VC
 @author   Xiaoliang Guo
 */

import HandyJSON

class MovieBriefModel: HandyJSON {
    
    // MARK: Stored Properties
    var id: String?
    var title: String?
    var poster_path: String?
    var popularity: Float?
    
    // MARK: Computed Properties
    var posterUrl: URL? {
        get {
            return MovieHelper.getImageUrl(path:poster_path!)
        }
    }
    
    // MARK: init methods
    required init() {}
}
