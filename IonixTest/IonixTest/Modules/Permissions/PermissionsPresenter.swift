//
//  PermissionsPresenter.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//  
//

import Foundation

class PermissionsPresenter: ViewToPresenterPermissionsProtocol {
    
    var permissionsArray: [Permission] = [
        Permission(name: "Camera Access", description: "Please allow access to your camera to take photos", image: "camera", allowTitle: "Allow", denyTitle: "Cancel"),
        Permission(name: "Enable Push notifications", description: "Enable push notifications to let send you personal news and updates.", image: "notifications", allowTitle: "Enable", denyTitle: "Cancel"),
        Permission(name: "Enable location services", description: "We wants to access your location only to provide a better experience by helping you find new friends nearby.", image: "location", allowTitle: "Enable", denyTitle: "Cancel"),
    ]

    // MARK: Properties
    var view: PresenterToViewPermissionsProtocol?
    var interactor: PresenterToInteractorPermissionsProtocol?
    var router: PresenterToRouterPermissionsProtocol?
    
    func getPermissionCount() -> Int {
        return permissionsArray.count
    }
    
    func getPermissionIn(row: Int) -> Permission {
        return permissionsArray[row]
    }
}

extension PermissionsPresenter: InteractorToPresenterPermissionsProtocol {
    
}
