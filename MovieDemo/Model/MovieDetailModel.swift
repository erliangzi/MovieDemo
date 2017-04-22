/*!
 @summary  Detail model for movie
 @detail   Used in movie detail VC
 @author   Xiaoliang Guo
 */

class MovieDetailModel: MovieBriefModel {
    
    // MARK: Stored Properties
    var overview: String?
    var genres: [[String : String]]?
    var spoken_languages: [[String : String]]?
    var runtime: Int?
    
    // MARK: Stored Properties
    var genre: String? {
        get {
            var retStr = String.init("genres：")!
            for tempGenre in genres! {
                retStr.append(tempGenre["name"]! + " ")
            }
            return retStr
        }
    }
    var language: String? {
        get {
            var retStr = String.init("language：")!
            for tempLan in spoken_languages! {
                retStr.append(tempLan["name"]! + " ")
            }
            return retStr
        }
    }
}
