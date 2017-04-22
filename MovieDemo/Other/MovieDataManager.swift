/*!
 @summary  Request API
 @detail   Request API
 @author   Xiaoliang Guo
 */

import Foundation
import Alamofire

class MovieDataManager {
    
    //get list data
    class func getMovieList(page: UInt, callback: @escaping ([MovieBriefModel]?, UInt) -> ()) {
        Alamofire.request("http://api.themoviedb.org/3/discover/movie", method: .get, parameters: ["api_key" : "328c283cd27bd1877d9080ccb1604c91", "primary_release_date.lte" : "2016-12-31", "sort_by" : "release_ date.desc", "page" : String(page)], encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if let json = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String : Any] {
                if let movieArr = json["results"] as? [Any] {
                    var movieModelArr: [MovieBriefModel] = []
                    for llt in movieArr {
                        if let movie = MovieBriefModel.deserialize(from: llt as? NSDictionary) {
                            if (movie.id?.characters.count)! < 6 {
                                movieModelArr.append(movie)
                            }
                        }
                    }
                    callback(movieModelArr, json["total_pages"] as! UInt)
                } else {
                    callback(nil, 0)
                }
            } else {
                callback(nil, 0)
            }
        }
    }
    
    //get detail data
    class func getMovieDetailInfo(movieID: String, callback: @escaping (MovieDetailModel?) -> ()) {
        Alamofire.request("http://api.themoviedb.org/3/movie/" + movieID, method: .get, parameters: ["api_key" : "328c283cd27bd1877d9080ccb1604c91"], encoding: URLEncoding.default, headers: nil).response { (response) in
            if let json = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String : Any] {
                var movie: MovieDetailModel? = nil
                if let tempMovie = MovieDetailModel.deserialize(from: json as NSDictionary) {
                    movie = tempMovie
                }
                callback(movie)
            } else {
                callback(nil)
            }
        }
    }
}
