//
//  SelectAccountRouter.swift
//  PaymentApp
//
//  Created by Renan Trapp on 24/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

class SelectAccountRouter {
    static func OpenSceneSelectAccount() -> UIViewController {
        let view = SelectAccountViewController()
        let presenter = SelectAccountPresenter(view: view)
        view.setUpView(with: presenter)
        let service = AccountServiceMock()
        let interactor = SelectAccountInteractor(service: service, presenter: presenter)
        presenter.setUpInteractor(interactor: interactor)
        
        return view
    }
}
