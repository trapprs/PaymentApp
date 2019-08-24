//
//  SelectAccountInteractorTests.swift
//  PaymentAppTests
//
//  Created by Renan Trapp on 24/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import XCTest
@testable import PaymentApp

class SelectAccountInteractorTests: XCTestCase {
    var selectAccount: SelectAccountInteractor!
    private var service: AccountServiceSpy!
    override func setUp() {
        super.setUp()
        
        service = AccountServiceSpy()
        selectAccount = SelectAccountInteractor(service: service, presenter: nil)
    }

    func testGetAccounts() {
        selectAccount.getAccounts()
        
        XCTAssert(service.accounts?.count == 2)
    }
    
    func testGetUserInformation() {
        selectAccount.getUserInformations()
        XCTAssert(service.user?.name == "Test")
    }
    
    override func tearDown() {
       super.tearDown()
    }
}

private class AccountServiceSpy: AccountServiceAccess {
    var user: User?
    var accounts: [Account]?
    
    func getAllAcountForPayment(completion: @escaping(Result<[Account], Error>) -> Void)  {
        let account1 = Account(id: 1, name: "Test", accountNumber: "1230493", nationalId: "000.000.000-12", type: .saving)
        let account2 = Account(id: 2, name: "Test2", accountNumber: "12304933", nationalId: "000.000.000-02", type: .checking)
        self.accounts = [account1, account2]
        completion(.success([account1, account2]))
    }
    
    func getUserInformations(completion: @escaping(Result<User, Error>) -> Void) {
       let account1 = Account(id: 1, name: "Test", accountNumber: "1230493", nationalId: "000.000.000-12", type: .saving)
        let userAccount: UserAccount = UserAccount(id: 1, balance: 20000, accounts: [account1])
        let user = User(name: "Test", id: 1, userAccount: [userAccount], nationalId: "030.032.321-23")
        self.user = user
        completion(.success(user))
    }
}
