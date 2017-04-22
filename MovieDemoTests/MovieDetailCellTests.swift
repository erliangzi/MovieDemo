//
//  MovieDetailCellTests.swift
//  MovieDemo
//
//  Created by 二亮子 on 2017/4/23.
//  Copyright © 2017年 二亮子. All rights reserved.
//

import XCTest
@testable import MovieDemo
class MovieDetailCellTests: XCTestCase {
    
    var movieDetailVC: MovieDetailController!
    var movieTestTableView: UITableView!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        movieDetailVC = storyboard.instantiateViewController(withIdentifier: "MovieDetailController") as! MovieDetailController
        
        _ = movieDetailVC.view
        
        movieTestTableView = movieDetailVC.movieTableView
        movieTestTableView.delegate = movieDetailVC
        movieTestTableView.dataSource = movieDetailVC
        
        let mockData = MockData()
        movieDetailVC.movie = mockData.getMockMovieDetailModel()
        movieTestTableView.reloadData()
    }
    
    func testMovieDetailCell_isEqual() {
        let cell = movieTestTableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! MovieDetailCell
        XCTAssertEqual(cell.titleLabel.text, "sunny")
        XCTAssertEqual(cell.popularityLabel.text,"Popularity：3.14")
        XCTAssertEqual(cell.overviewLabel.text, "aOverView")
        XCTAssertEqual(cell.genresLabel.text, "genres：OK GOOD ")
        XCTAssertEqual(cell.languagesLabel.text, "language：en sf ")
        XCTAssertEqual(cell.runtimeLabel.text, "90min")
    }
    
    
}
