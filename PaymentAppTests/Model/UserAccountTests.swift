//
//  UserAccountTests.swift
//  PaymentAppTests
//
//  Created by Renan Trapp on 24/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import XCTest
@testable import PaymentApp

class UserAccountTests: XCTestCase {
    var account: Account!
    var userAccoount: UserAccount!
    
    override func setUp() {
        super.setUp()
        
        self.account = Account(id: 1, name: "Test", accountNumber: "1230493", nationalId: "000.000.000-12", type: .saving)
        self.userAccoount = UserAccount(id: 1, balance: 30000, accounts: [account])
    }

    func testInitializer() {
       XCTAssertNotNil(self.userAccoount)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
