/*!
 @summary  Select seats
 @detail   Used in "MovieSelectSeatController"
 @author   Xiaoliang Guo
 */

import UIKit

class MovieSelectSeatCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    typealias SelectSeatCallback = (Bool, Int) -> ()
    
    // MARK: Properties
    let seatCellReuseID = "seatCell"
    var callback: SelectSeatCallback? = nil
    @IBOutlet var collectionView: UICollectionView!
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.allowsMultipleSelection = true
    }
    
    // MARK: CollectionView delegate and datasource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 40, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:  UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: seatCellReuseID, for: indexPath)
        let textLabel = cell.viewWithTag(1) as! UILabel
        textLabel.text = String(indexPath.row)
        
        if cell.isSelected {
            cell.contentView.backgroundColor = UIColor.color(seatType: .YourSeat)
        } else {
            cell.contentView.backgroundColor = UIColor.color(seatType: .Aviliable)
        }
        
        //Mock seat type---------------------------------------------
        if 0 == indexPath.row {
            cell.contentView.backgroundColor = UIColor.color(value: MovieSeatType.Wheelchair.rawValue)
        } else if indexPath.row % 19 == 0 {
            cell.contentView.backgroundColor = UIColor.color(seatType: .Sold)
        } else if indexPath.row % 27 == 0 {
            cell.contentView.backgroundColor = UIColor.color(seatType: .Companion)
        } else if indexPath.row % 36 == 0 {
            cell.contentView.backgroundColor = UIColor.color(seatType: .Couple)
        }
        //Mock seat type---------------------------------------------
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        if indexPath.row != 0 && indexPath.row % 19 != 0 && indexPath.row % 27 != 0 && indexPath.row % 36 != 0 {
            cell?.contentView.backgroundColor = UIColor.color(seatType: .YourSeat)
            if callback != nil {
                callback!(true, indexPath.row)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        if indexPath.row != 0 && indexPath.row % 19 != 0 && indexPath.row % 27 != 0 && indexPath.row % 36 != 0 {
            cell?.contentView.backgroundColor = UIColor.color(seatType: .Aviliable)
            if callback != nil {
                callback!(false, indexPath.row)
            }
        }
    }
}
