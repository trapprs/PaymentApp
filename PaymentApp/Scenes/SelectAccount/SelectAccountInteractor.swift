//
//  SelectAccountInteractor.swift
//  PaymentApp
//
//  Created by Renan Trapp on 24/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

protocol SelectAccountInteractorProtocol {
    func getAccounts()
    func getUserInformations()
}

protocol AccountServiceAccess {
    func getAllAcountForPayment(completion: @escaping(Result<[Account], Error>) -> Void)
    func getUserInformations(completion: @escaping(Result<User, Error>) -> Void)
}

class SelectAccountInteractor: SelectAccountInteractorProtocol {
    private var service: AccountServiceAccess?
    private var presenter: SelectAccountPresenterProtocol?
    
    init(service: AccountServiceAccess, presenter: SelectAccountPresenterProtocol?) {
        self.service = service
        self.presenter = presenter
    }
    
    func getAccounts() {
        service?.getAllAcountForPayment(completion: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                self.presenter?.getAccountToShow(accounts: data)
            case .failure(let error):
                self.presenter?.getReturnError(error: error)
            }
        })
    }
    
    func getUserInformations() {
        service?.getUserInformations(completion: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                self.presenter?.getUserInformation(user: data)
            case .failure(let error):
                self.presenter?.getReturnError(error: error)
            }
        })
    }
}
