//
//  PermissionsContract.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//  
//

import Foundation

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewPermissionsProtocol {
    func scrollForward()
    func goToHome()
    func showSystemAlert(title: String, message: String, completion: (() -> Void)?)
}

// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterPermissionsProtocol {

    var view: PresenterToViewPermissionsProtocol? { get set }
    var interactor: PresenterToInteractorPermissionsProtocol? { get set }
    var router: PresenterToRouterPermissionsProtocol? { get set }

    func getPermissionCount() -> Int
    func getPermissionIn(row: Int) -> Permission
    func askForPermission(row: Int)
    func denyAndContinue(row: Int)
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorPermissionsProtocol {
    var presenter: InteractorToPresenterPermissionsProtocol? { get set }
}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterPermissionsProtocol {

}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterPermissionsProtocol {

}
