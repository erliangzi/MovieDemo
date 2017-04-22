//
//  MockData.swift
//  MovieDemo
//
//  Created by 二亮子 on 2017/4/23.
//  Copyright © 2017年 二亮子. All rights reserved.
//

import XCTest
@testable import MovieDemo
class MockData {
    
    func getGenresArray() -> [[String : String]]? {
        return [["name" : "hello"], ["name" : "world"]]
    }
    
    func getLanguagesArray() -> [[String : String]]? {
        return [["name" : "hi"], ["name" : "boys"]]
    }
    
    func getMockMovieArray() -> [MovieBriefModel]{
        
        let model1:MovieBriefModel = MovieBriefModel()
        model1.id = "1"
        model1.title = "model1"
        model1.poster_path = "ksldja"
        model1.popularity = 0.8
        
        let model2:MovieBriefModel = MovieBriefModel()
        model2.id = "2"
        model2.title = "model2"
        model2.poster_path = "ksldja"
        model2.popularity = 0.5
        return [model1, model2]
        
    }
    
    func getMockMovieDetailModel() -> MovieDetailModel? {
        let detailModel = MovieDetailModel()
        detailModel.overview = "aOverView"
        detailModel.genres = [["name" : "OK"], ["name" : "GOOD"]]
        detailModel.spoken_languages = [["name" : "en"], ["name" : "sf"]]
        detailModel.runtime = 90
        detailModel.title = "sunny"
        detailModel.poster_path = "/poster/path"
        detailModel.popularity = 3.14
        return detailModel
    }
    
    
    
    
    
}
