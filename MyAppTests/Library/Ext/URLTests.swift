//
//  URLTests.swift
//  MyApp
//
//  Created by iOSTeam on 2/21/18.
//  Copyright © 2018 Asian Tech Co., Ltd. All rights reserved.
//

import XCTest

@testable import MyApp

final class URLTests: XCTestCase {
    func testInit() {
        for code in 100..<600 {
            guard let status = HTTPStatus(code: code) else { continue }
            XCTAssertEqual(status.code, code)
            XCTAssertGreaterThan(status.description.count, 0)
            let error = NSError(status: status)
            XCTAssertEqual(error.code, status.code)
            XCTAssertEqual(error.localizedDescription, status.description)
        }
    }
}
