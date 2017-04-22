/*!
 @summary  Config data
 @detail   Config data
 @author   Xiaoliang Guo
 */

import Foundation
import UIKit

let SegueIDToDetail = "toDetail"
let SegueIDToSelectSeat = "toSelectSeat"
let SegueIDToSelectTicket = "toSelectTicket"
let SegueIDToConfirm = "toConfirm"
let SegueIDToPay = "toPay"
let NormalCellHeight: CGFloat = 44
let MovieSeatViewHeight: CGFloat = 60
let MovieSelectSeatViewHeight: CGFloat = 200
let MovieTicketsTipsViewHeight: CGFloat = 160
let MovieConfirmInputCellHeight: CGFloat = 170
let MovieConfirmCheckCellHeight: CGFloat = 200
let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

enum PayType: String {
    case Visa = "VISA"
    case MasterCard = "MASTERCARD"
}

enum MoviePickerType: String {
    case SelectCinema = "Select Cinema"
    case SelectDayAndTime = "Select Day And Time"
    case SelectTicketCount = "Select Tickets Counts"
}

enum MovieSeatType: UInt32 {
    case YourSeat = 0x75B8CB
    case Aviliable = 0xAAAAAA
    case Wheelchair = 0xB85E42
    case Companion = 0xD5AE4D
    case Couple = 0xD52313
    case Sold = 0x383878
}

let CinemaData = ["Atmos Marvel's Guardians Of The Galaxy Vol 2 TBA",
                  "Fabricated City NC16",
                  "Fast & Furious 8 PG13",
                  "123",
                  "afdsf",
                  "afd321"]

let DateData = ["2017.4.25", "2017.4.26", "2017.4.30", "2017.4.25", "2017.5.1", "2017.5.5"]

let TimeData = ["8:15", "10:50", "13:30", "16:00", "19:30", "22:45"]

//请求失败，断网，提示精简代码，写注释，单元测试, 断网crash



