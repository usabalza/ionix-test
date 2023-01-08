//
//  PermissionsPresenter.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//  
//

import Foundation
import AVFoundation
import UserNotifications
import CoreLocation

class PermissionsPresenter: ViewToPresenterPermissionsProtocol {

    var permissionsArray: [Permission] = [
        Permission(
            name: "Camera Access",
            description: "Please allow access to your camera to take photos",
            image: "camera",
            allowTitle: "Allow",
            denyTitle: "Cancel"
        ),
        Permission(
            name: "Enable Push notifications",
            description: "Enable push notifications to let send you personal news and updates.",
            image: "notifications",
            allowTitle: "Enable",
            denyTitle: "Cancel"
        ),
        Permission(
            name:"Enable location services",
            description: "We wants to access your location only to provide a better experience by helping you find new friends nearby.",
            image: "location",
            allowTitle: "Enable",
            denyTitle: "Cancel"
        )
    ]

    // MARK: - Properties
    var view: PresenterToViewPermissionsProtocol?
    var interactor: PresenterToInteractorPermissionsProtocol?
    var router: PresenterToRouterPermissionsProtocol?

    func getPermissionCount() -> Int {
        return permissionsArray.count
    }

    func getPermissionIn(row: Int) -> Permission {
        return permissionsArray[row]
    }

    func askForPermission(row: Int) {
        switch row {
        case 0:
            cameraPermission()
        case 1:
            notificationPermission()
        case 2:
            locationPermission()
        default: break
        }
    }

    func denyAndContinue(row: Int) {
        if row == 2 {
            view?.goToHome()
        } else {
            view?.scrollForward()
        }
    }

    func cameraPermission() {
        // Method for request permission to camera.
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized: // The user has previously granted access to the camera.
            view?.scrollForward()

        case .notDetermined: // The user has not yet been asked for camera access.
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    self.view?.scrollForward()
                }
            }
        case .denied, .restricted: // The user has previously denied or restricted access.
            return
        @unknown default:
            return
        }
    }

    func notificationPermission() {
        // Method to request permission to send notifications to the user.
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { _, error in
            if let error = error {
                // Handle the error here.
                print(error)
                return
            }
            // Enable or disable features based on the authorization.
            self.view?.scrollForward()
        }
    }

    func locationPermission() {
        // Method to request the use of current location.
        let locationManager = CLLocationManager()
        let status = locationManager.authorizationStatus
        switch status {
        case .restricted, .denied, .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default: break
        }
        view?.goToHome()
    }
}

extension PermissionsPresenter: InteractorToPresenterPermissionsProtocol {

}
