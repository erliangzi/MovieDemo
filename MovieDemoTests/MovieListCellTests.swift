//
//  MovieListCellTests.swift
//  MovieDemo
//
//  Created by 二亮子 on 2017/4/23.
//  Copyright © 2017年 二亮子. All rights reserved.
//

import XCTest
@testable import MovieDemo
class MovieListCellTests: XCTestCase {
    
    var movieListVC: MovieListController!
    var movieTestTableView: UITableView!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        movieListVC = storyboard.instantiateViewController(withIdentifier: "MovieListController") as! MovieListController
        
        _ = movieListVC.view
        
        movieTestTableView = movieListVC.movieTableView
        movieTestTableView.delegate = movieListVC
        movieTestTableView.dataSource = movieListVC
        
        let mockData = MockData()
        movieListVC.movieArr = mockData.getMockMovieArray()
        movieTestTableView.reloadData()
    }
    
    func testMovieListCell_isEqual() {
        let cell = movieTestTableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! MovieListCell
        XCTAssertEqual(cell.titleLabel.text, "model1")
        XCTAssertEqual(cell.popularityLabel.text,"Popularity：0.80")
    }
}
