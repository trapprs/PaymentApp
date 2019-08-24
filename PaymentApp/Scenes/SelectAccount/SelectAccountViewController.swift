//
//  SelectAccountViewController.swift
//  PaymentApp
//
//  Created by Renan Trapp on 24/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

protocol SelectAccountViewProtocol {
    func setUpView(with presenter: SelectAccountPresenterInput)
    func showAccounts(accounts: [Account])
    func showError(error: Error)
    func showUserInformation(user: User)
}

class SelectAccountViewController: UIViewController {
    @IBOutlet weak var userAccountTableView: UITableView!
    @IBOutlet weak var accountsTableView: UITableView!
    private var presenter: SelectAccountPresenterInput?
    
    init() {
        super.init(nibName: "SelectAccountViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(with presenter: SelectAccountPresenterInput) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.loadAccounts()
        self.presenter?.loadUser()
    }
}

extension SelectAccountViewController: SelectAccountViewProtocol {
    func showAccounts(accounts: [Account]) {
        print(accounts)
    }
    
    func showError(error: Error) {
        
    }
    
    func showUserInformation(user: User) {
        print(user.userAccount)
    }
}
