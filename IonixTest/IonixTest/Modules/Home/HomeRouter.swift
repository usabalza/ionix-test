//
//  HomeRouter.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//  
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterHomeProtocol {

    // MARK: - Static methods
    static func createModule() -> UIViewController {

        let viewController = HomeViewController()

        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()

        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor?.presenter = presenter

        return viewController
    }

}
