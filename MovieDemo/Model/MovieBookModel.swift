/*!
 @summary  Book model for "select seats", "select tickets"
 @detail   Used in "MovieSelectSeatController", 
                   "MovieSelectTicketController"
 @author   Xiaoliang Guo
 */

import Foundation

class MovieBookModel {
    
    // MARK: Stored Properties
    var imgUrl: URL?
    var title: String?
    var cinema: String?
    var dayTime: String?
    var ticketCount: UInt8?
    
    // MARK: Convenient init method
    class func movieBookModel(aImgUrl: URL?, aTitle: String?, aCinema: String?, aDayTime: String?, aticketCount: UInt8?) -> MovieBookModel {
        let aModel = MovieBookModel()
        aModel.imgUrl = aImgUrl
        aModel.title = aTitle
        aModel.cinema = aCinema
        aModel.dayTime = aDayTime
        aModel.ticketCount = aticketCount
        return aModel
    }
}
