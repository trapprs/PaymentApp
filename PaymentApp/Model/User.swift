//
//  User.swift
//  PaymentApp
//
//  Created by Renan Trapp on 24/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

struct User: Codable {
    var name: String
    var id: Int
    var userAccount: [UserAccount]
    var nationalId: String
}
