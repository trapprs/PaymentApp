//
//  Account.swift
//  PaymentApp
//
//  Created by Renan Trapp on 24/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

struct Account: Codable {
    var id: Int
    var name: String
    var accountNumber: String
    var nationalId: String
    var type: TypeAccount
}

enum TypeAccount: String, Codable {
    case saving = "saving"
    case checking = "checking"
}
