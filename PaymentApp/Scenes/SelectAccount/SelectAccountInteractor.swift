//
//  SelectAccountInteractor.swift
//  PaymentApp
//
//  Created by Renan Trapp on 24/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

protocol SelectAccountInteractorProtocol {
    func getAccounts() -> [Account]
    func getUserInformations() -> User?
}

protocol AccountServiceAccess {
    func getAllAcountForPayment(completion: @escaping(Result<[Account], Error>) -> Void)
    func getUserInformations(completion: @escaping(Result<User, Error>) -> Void)
}

class SelectAccountInteractor: SelectAccountInteractorProtocol {
    var service: AccountServiceAccess?
    
    init(service: AccountServiceAccess) {
        self.service = service
    }
    
    func getAccounts() -> [Account] {
        var resultAccounts: [Account] = []
        service?.getAllAcountForPayment(completion: { result in
            switch result {
            case .success(let data):
                resultAccounts = data
            case .failure(_):
                resultAccounts = []
            }
        })
        return resultAccounts
    }
    
    func getUserInformations() -> User? {
        var user: User? = nil
        service?.getUserInformations(completion: { result in
            switch result {
                
            case .success(let data):
                user = data
            case .failure(_):
                break
            }
        })
        return user
    }
}
