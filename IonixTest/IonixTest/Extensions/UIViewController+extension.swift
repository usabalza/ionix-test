//
//  UIViewController+extension.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 7/1/23.
//

import UIKit

struct Alert {
    var title: String?
    var message: String?
    var style: UIAlertController.Style = .alert
    var buttons: [(title: String, style: UIAlertAction.Style, action: (() -> Void)?)] = []
    var then: (() -> Void)?
}

extension UIViewController {
    func showAlert(alertModel: Alert) {
        let alert = UIAlertController(title: alertModel.title, message: alertModel.message, preferredStyle: alertModel.style)
        if alertModel.buttons.isEmpty {
            alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { _ in
                alertModel.then?()
            }))
        } else {
            for button in alertModel.buttons {
                alert.addAction(UIAlertAction.init(title: button.title, style: button.style, handler: { (action) in
                    button.action?()
                }))
            }
        }
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
