//
//  AddressSearchFactory.swift
//  DeliveryAppChallenge
//
//  Created by Renato F. dos Santos Jr on 11/02/23.
//

import UIKit

enum AddressSearchControllerFactory {

    static func make(delegate: HomeDisplayLogic?) -> AddressSearchViewController {
        let addressListView = AddressListView()
        let presenter = AddressSearchPresenter()
        let network = NetworkManager()
        let interactor = AddressSearchInteractor(with: presenter, and: network)
        let router = AddressSearchRouter()
        let controller = AddressSearchViewController(addressListView: addressListView,
                                                     router: router,
                                                     delegate: delegate,
                                                     interactor: interactor)

        router.viewController = controller
        presenter.controller = controller

        return controller
    }

}
