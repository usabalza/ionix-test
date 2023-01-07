//
//  UIViewController+extension.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 7/1/23.
//

import UIKit

extension UIViewController {
    func showAlert(title: String?, message: String?,style: UIAlertController.Style = .alert, buttons: [(title:String,style: UIAlertAction.Style,action:(()->())?)] = [],then: (()->())?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        if buttons.isEmpty{
            alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { (action) in
                then?()
            }))
        }else{
            for b in buttons{
                alert.addAction(UIAlertAction.init(title: b.title, style: b.style, handler: { (action) in
                    b.action?()
                }))
            }
        }
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
