/*!
 @summary  Show movie detail
 @detail   Show movie detail
 @author   Xiaoliang Guo
 */

import UIKit

class MovieDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    let selectCellReusedID = "selectCell"
    var detailID: String?
    var movie: MovieDetailModel?
    var cinemaName: String? = nil
    var dayTime: String? = nil
    @IBOutlet var bookBtn: UIButton!
    @IBOutlet var movieTableView: UITableView!
    @IBOutlet var pickerManager: MoviePickerManager!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Auto computed cell height
        movieTableView.rowHeight = UITableViewAutomaticDimension
        movieTableView.estimatedRowHeight = NormalCellHeight;
        if detailID != nil {
            MovieHelper.showLoadingView()
            MovieDataManager.getMovieDetailInfo(movieID: detailID!) { (movieDetail) in
                MovieHelper.hiddenLoadingView()
                self.movie = movieDetail
                self.movieTableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIDToSelectSeat {
            let detail = segue.destination as! MovieSelectSeatController
            detail.bookModel = MovieBookModel.movieBookModel(aImgUrl: movie?.posterUrl, aTitle: movie?.title, aCinema: cinemaName, aDayTime: dayTime, aticketCount: 0)
        }
    }
    
    // MARK: TableView delegate and datasource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return (nil == movie) ? 0 : 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (0 == section) ? 1 : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if 0 == indexPath.section {
            let cell = tableView.dequeueReusableCell(withIdentifier:MovieDetailCell.reusedID)! as! MovieDetailCell
            cell.setupData(movie: movie!)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: selectCellReusedID)!
            if 0 == indexPath.row {
                cell.textLabel?.text = MoviePickerType.SelectCinema.rawValue
            } else if 1 == indexPath.row {
                cell.textLabel?.text = MoviePickerType.SelectDayAndTime.rawValue
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if 1 == indexPath.section {
            let selectCell = tableView.cellForRow(at: indexPath)
            if 0 == indexPath.row {
                pickerManager.showPicker(type: .SelectCinema, callback: { [weak self] (cinemaName) -> () in
                    self?.cinemaName = cinemaName
                    selectCell?.textLabel?.textColor = .black
                    selectCell?.textLabel?.text = cinemaName
                    self?.setupBookBtn()
                })
            } else if 1 == indexPath.row {
                pickerManager.showPicker(type: .SelectDayAndTime, callback: { [weak self] (dayTime) in
                    self?.dayTime = dayTime
                    selectCell?.textLabel?.textColor = .black
                    selectCell?.textLabel?.text = dayTime
                    self?.setupBookBtn()
                })
            }
        }
    }
    
    // MARK: Private methods
    private func setupBookBtn() {
        if cinemaName != nil && dayTime != nil {
            bookBtn.isEnabled = true
        } else {
            bookBtn.isEnabled = false
        }
    }
}
