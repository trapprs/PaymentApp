//
//  SelectAccountPresenter.swift
//  PaymentApp
//
//  Created by Renan Trapp on 24/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import Foundation

protocol SelectAccountPresenterProtocol {
    func getAccountToShow(accounts: [Account])
    func getReturnError(error: Error)
    func getUserInformation(user: User)
}

protocol SelectAccountPresenterInput {
    func loadAccounts()
    func loadUser()
}

class SelectAccountPresenter: SelectAccountPresenterProtocol {
    private var view: SelectAccountViewProtocol?
    private var interactor: SelectAccountInteractorProtocol?
    
    init(view: SelectAccountViewProtocol?) {
        self.view = view
    }
    
    func setUpInteractor(interactor: SelectAccountInteractorProtocol?) {
        self.interactor = interactor
    }
    
    func getAccountToShow(accounts: [Account]) {
        view?.showAccounts(accounts: accounts)
    }
    
    func getReturnError(error: Error) {
        view?.showError(error: error)
    }
    
    func getUserInformation(user: User) {
        view?.showUserInformation(user: user)
    }
}

extension SelectAccountPresenter: SelectAccountPresenterInput {
    func loadAccounts() {
        interactor?.getAccounts()
    }
    
    func loadUser() {
        interactor?.getUserInformations()
    }
}
