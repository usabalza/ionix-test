//
//  PermissionsRouter.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//  
//

import Foundation
import UIKit

class PermissionsRouter: PresenterToRouterPermissionsProtocol {

    // MARK: - Static methods
    static func createModule(isPushed: Bool) -> UIViewController {

        let viewController = PermissionsViewController()

        let presenter: ViewToPresenterPermissionsProtocol & InteractorToPresenterPermissionsProtocol = PermissionsPresenter()

        viewController.presenter = presenter
        viewController.presenter?.router = PermissionsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = PermissionsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.isPushed = isPushed

        return viewController
    }

}
