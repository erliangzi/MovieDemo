/*!
 @summary  MoviePickerView's Manager
 @detail   Wrap MoviePickerView
 @author   Xiaoliang Guo
 */

import Foundation
import UIKit

let PickerHeight: CGFloat = 200.0
let PickerAnimationDuration = 0.4

class MoviePickerManager: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    typealias PickerCallback = (String) -> ()
    
    let tapGesture = UITapGestureRecognizer.init()
    
    var pickerView: MoviePicker! = nil
    
    var cinemaStr: String! = nil
    var dateStr: String! = nil
    var timeStr: String! = nil
    var ticketStr: String! = nil
    var pickerType = MoviePickerType.SelectCinema
    var pickerCallback: (PickerCallback)? = nil
    
    var ticketCount: UInt8! = nil
    
    func showPicker(type: MoviePickerType, callback: (PickerCallback)?) {
        cinemaStr = CinemaData[0]
        dateStr = DateData[0]
        timeStr = TimeData[0]
        ticketStr = "1"
        pickerType = type
        pickerCallback = callback
        pickerView = MoviePicker.picker(type: type, target: self)
        pickerView.frame = CGRect.init(x: 0, y: ScreenHeight, width: ScreenWidth, height: PickerHeight)
        let bgView = UIView.init(frame: UIScreen.main.bounds)
        tapGesture.addTarget(self, action: #selector(p_bgTapHandle(tap:)))
        bgView.addGestureRecognizer(tapGesture)
        bgView.backgroundColor = .clear
        bgView.addSubview(pickerView)
        AppDeleWindow!?.addSubview(bgView)
        UIView.animate(withDuration: PickerAnimationDuration, animations: {
            self.pickerView.frame = CGRect.init(x: 0, y: ScreenHeight - PickerHeight, width: ScreenWidth, height: PickerHeight)
        })
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerType == .SelectCinema || pickerType == .SelectTicketCount {
            return 1
        } else if pickerType == .SelectDayAndTime {
            return 2
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerType == .SelectCinema {
            return CinemaData.count
        } else if pickerType == .SelectDayAndTime {
            if 0 == component {
                return DateData.count
            } else if 1 == component {
                return DateData.count
            }
        } else if pickerType == .SelectTicketCount && ticketCount != nil {
            return Int.init(ticketCount)
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerType == .SelectCinema {
            return CinemaData[row]
        } else if pickerType == .SelectDayAndTime {
            if 0 == component {
                return DateData[row]
            } else if 1 == component {
                return TimeData[row]
            }
        } else if pickerType == .SelectTicketCount {
            return String(row + 1)
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerType == .SelectCinema {
            cinemaStr = CinemaData[row]
        } else if pickerType == .SelectDayAndTime {
            if 0 == component { //date
                dateStr = DateData[row]
            } else if 1 == component { //time
                timeStr = TimeData[row]
            }
        } else if pickerType == .SelectTicketCount {
            ticketStr = String(row + 1)
        }
    }
    
    @IBAction func okBtnHandle(_ sender: UIButton) {
        p_bgTapHandle(tap: tapGesture)
    }
    
    func p_bgTapHandle(tap: UITapGestureRecognizer) {
        if pickerType == .SelectCinema {
            pickerCallback?(cinemaStr)
        } else if pickerType == .SelectDayAndTime {
            pickerCallback?(dateStr + " " + timeStr)
        } else if pickerType == .SelectTicketCount {
            pickerCallback?(ticketStr)
        }
        UIView.animate(withDuration: PickerAnimationDuration, animations: { 
            self.pickerView.frame = CGRect.init(x: 0, y: ScreenHeight, width: ScreenWidth, height: PickerHeight)
        }) { (flag) in
            let bgView = tap.view
            bgView?.removeFromSuperview()
        }
    }
    
}
