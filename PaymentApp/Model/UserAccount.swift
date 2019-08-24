//
//  UserAccount.swift
//  PaymentApp
//
//  Created by Renan Trapp on 24/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

struct UserAccount: Codable {
    var id: Int
    var balance: Int
    var account: Account?
}
