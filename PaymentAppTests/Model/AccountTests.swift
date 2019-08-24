//
//  AccountTests.swift
//  PaymentAppTests
//
//  Created by Renan Trapp on 24/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import XCTest
@testable import PaymentApp

class AccountTests: XCTestCase {
    var account: Account!
    
    override func setUp() {
        super.setUp()
        
        self.account = Account(id: 1, name: "Test", accountNumber: "1230493", nationalId: "000.000.000-12", type: .saving)
    }

    func testInitializer() {
        XCTAssertNotNil(self.account)
    }
    
    override func tearDown() {
        super.tearDown()
    }

}
