//
//  MovieDetailModelTests.swift
//  MovieDemo
//
//  Created by 二亮子 on 2017/4/23.
//  Copyright © 2017年 二亮子. All rights reserved.
//

import XCTest
@testable import MovieDemo
class MovieDetailModelTests: XCTestCase {
    
    let detailModel = MovieDetailModel()
    
    override func setUp() {
        super.setUp()
        let mockData = MockData()
        detailModel.genres = mockData.getGenresArray()
        detailModel.spoken_languages = mockData.getLanguagesArray()
    }
    
    func testGenre() {
        XCTAssertEqual(detailModel.genre, "genres：hello world ")
    }
    
    func testLanguage() {
        XCTAssertEqual(detailModel.language, "language：hi boys ")
    }
}
