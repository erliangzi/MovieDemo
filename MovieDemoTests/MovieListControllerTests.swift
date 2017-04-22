//
//  MovieListControllerTests.swift
//  MovieDemo
//
//  Created by 二亮子 on 2017/4/23.
//  Copyright © 2017年 二亮子. All rights reserved.
//

import XCTest
@testable import MovieDemo
class MovieListControllerTests: XCTestCase {
    
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
    
    func testTableViewNil(){
        XCTAssertNotNil(movieTestTableView)
    }
    func testViewDidLoad_ShouldSetTableViewDataSource(){
        XCTAssertNotNil(movieTestTableView!.dataSource)
    }
    
    func testViewDidLoad_ShouldSetTableViewDelegate() {
        XCTAssertNotNil(movieTestTableView!.delegate)
    }
    
    func testNumberOfSections_IsOne(){
        let numberOfSections = movieTestTableView.numberOfSections
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func testNumberOfRowsInSection(){
        XCTAssertEqual(movieTestTableView.numberOfRows(inSection: 0),2)
    }
    
    func testCellContent(){
        let cell1 = movieTestTableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! MovieListCell
        XCTAssertEqual(cell1.titleLabel.text, "model1")
        XCTAssertEqual(cell1.popularityLabel.text,"Popularity：0.80")
        
        let cell2 = movieTestTableView.cellForRow(at: IndexPath.init(row: 1, section: 0)) as! MovieListCell
        XCTAssertEqual(cell2.titleLabel.text, "model2")
        XCTAssertEqual(cell2.popularityLabel.text,"Popularity：0.50")
    }
    
    func testTableViewDidSelected(){
        movieTestTableView.selectRow(at: IndexPath.init(row: 0, section: 0), animated: true, scrollPosition: UITableViewScrollPosition.middle)
    }
}
