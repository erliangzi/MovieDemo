//
//  MovieBookModelTests.swift
//  MovieDemo
//
//  Created by 二亮子 on 2017/4/23.
//  Copyright © 2017年 二亮子. All rights reserved.
//

import XCTest
@testable import MovieDemo
class MovieBookModelTests: XCTestCase {
    
    let bookModel = MovieBookModel.movieBookModel(aImgUrl: URL.init(string: "http://baidu.com"), aTitle: "aTitle", aCinema: nil, aDayTime: "2017-5-1", aticketCount: 100)
    override func setUp() {
        super.setUp()
    }
    
    func testBookModelNil() {
        XCTAssertNotNil(bookModel)
    }
    
    func testBookModel_isEqual() {
        XCTAssertEqual(bookModel.imgUrl, URL.init(string: "http://baidu.com"))
        XCTAssertEqual(bookModel.title, "aTitle")
        XCTAssertEqual(bookModel.cinema, nil)
        XCTAssertEqual(bookModel.dayTime, "2017-5-1")
        XCTAssertEqual(bookModel.ticketCount, 100)
    }
}
