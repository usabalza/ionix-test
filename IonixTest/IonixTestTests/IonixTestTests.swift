//
//  IonixTestTests.swift
//  IonixTestTests
//
//  Created by Uziel Sabalza on 5/1/23.
//

import XCTest
@testable import IonixTest

final class IonixTestTests: XCTestCase {
    
    var urlSession: URLSession!
    var memeArray: [Meme]!
    var homeEndpoint: URL!
    var searchEndpoint: URL!
    var after: String!
    var text: String!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        urlSession = URLSession(configuration: .default)
        after = "t3_kgsiv7"
        text = "Condorito"
        memeArray = [
            Meme(title: "American Jehova's witnesses singing in the streets of Chile.", url: "https://v.redd.it/tu7ebw2g508a1", score: 10271, numComments: 2634),
            Meme(title: "A normal Tuesday road rage in Chile", url: "https://v.redd.it/shz6f7sj084a1", score: 4473, numComments: 457)
        ]
        homeEndpoint = Endpoints.getAll(after: after).url
        searchEndpoint = Endpoints.searchText(text: text, after: after).url
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        urlSession = nil
        after = nil
        text = nil
        memeArray = nil
        homeEndpoint = nil
        searchEndpoint = nil
    }
    
    func testHomeTableViewIsNotEmpty() throws {
        XCTAssertNotEqual(memeArray.count, 0, "The array of source is not empty.")
    }
    
    func testAPICallToHomeIs200() throws {
        let promise = expectation(description: "Status code: 200")
        
        let dataTask = urlSession.dataTask(with: homeEndpoint) { _, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
    }
    
    func testAPICallToSearchIs200() throws {
        let promise = expectation(description: "Status code: 200")
        
        let dataTask = urlSession.dataTask(with: searchEndpoint) { _, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
    }
    
}
