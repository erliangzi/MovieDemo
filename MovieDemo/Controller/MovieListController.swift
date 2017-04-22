/*!
 @summary  Show movie list
 @detail   Show movie list
 @author   Xiaoliang Guo
 */

import UIKit
import Refresher

class MovieListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    var movieArr: [MovieBriefModel] = []
    var isLoadingData = true
    var currentPage: UInt = 1
    var totalPage: UInt = 0
    var loadMoreView: MovieLoadMoreView? = nil
    @IBOutlet var movieTableView: UITableView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFirstPage(isRefresh: false)
        
        //add refresh
        movieTableView.addPullToRefreshWithAction {
            self.loadFirstPage(isRefresh: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIDToDetail {
            let index = movieTableView.indexPath(for: sender as! UITableViewCell)?.row
            let detail = segue.destination as! MovieDetailController
            detail.detailID = movieArr[index!].id
        }
    }
    
    // MARK: TableView delegate and datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MovieListCell.Height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:MovieListCell.reusedID)! as! MovieListCell
        cell.setupData(movie: movieArr[indexPath.row])
        return cell
    }
    
    // MARK: ScrollView delegate methods
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let toBottom = scrollView.contentSize.height - scrollView.contentOffset.y < scrollView.frame.size.height
        if toBottom && !isLoadingData {
            handleLoadmore()
        }
    }
    
    // MARK: Private methods
    private func handleLoadmore() {
        isLoadingData = true
        if loadMoreView == nil {
            loadMoreView = MovieLoadMoreView.loadMoreView()
            loadMoreView?.frame.origin = CGPoint.init(x: 0, y: movieTableView.contentSize.height)
            movieTableView.addSubview(loadMoreView!)
        }
        loadMoreView?.indicatorView.startAnimating()
        movieTableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: MovieLoadMoreView.Height, right: 0)
        MovieDataManager.getMovieList(page: currentPage + 1) { [weak self] (mArr, tPages) in
            self?.currentPage = (self?.currentPage)! + 1
            self?.isLoadingData = false
            self?.movieTableView.contentInset = UIEdgeInsets.zero
            self?.loadMoreView?.frame.origin = CGPoint.init(x: 0, y: (self?.movieTableView.contentSize.height)!)
            self?.loadMoreView?.indicatorView.stopAnimating()
            if mArr != nil {
                self?.movieArr.append(contentsOf: mArr!)
                self?.movieTableView.reloadData()
            }
        }
    }
    
    private func loadFirstPage(isRefresh: Bool) {
        if !isRefresh { //first
            MovieHelper.showLoadingView()
        }
        MovieDataManager.getMovieList(page: 1) { [weak self] (mArr, tPages) in
            self?.isLoadingData = false
            if isRefresh {
                self?.movieTableView.stopPullToRefresh()
            } else {
                MovieHelper.hiddenLoadingView()
            }
            if mArr != nil {
                self?.movieArr = mArr!
                self?.movieTableView.reloadData()
            }
        }
    }
}
