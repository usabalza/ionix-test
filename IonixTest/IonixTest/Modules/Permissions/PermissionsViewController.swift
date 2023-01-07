//
//  PermissionsViewController.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//  
//

import UIKit
import CoreLocation

class PermissionsViewController: UIViewController {
    
    @IBOutlet weak var permissionsCollection: UICollectionView!
    
    var isPushed: Bool = false
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCollectionView()
    }
    
    func loadCollectionView() {
        permissionsCollection.register(UINib.init(nibName: PermissionCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PermissionCollectionViewCell.identifier)
        permissionsCollection.delegate = self
        permissionsCollection.dataSource = self
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterPermissionsProtocol?
    
}

extension PermissionsViewController: PresenterToViewPermissionsProtocol{
    // TODO: Implement View Output Methods
    func scrollForward() {
        guard let presenter = presenter else { return }
        DispatchQueue.main.async {
            let visibleItems: NSArray = self.permissionsCollection.indexPathsForVisibleItems as NSArray
            let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
            let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
            if nextItem.row < presenter.getPermissionCount() {
                self.permissionsCollection.scrollToItem(at: nextItem, at: .left, animated: true)
            }
        }
    }
    
    func goToHome() {
        if isPushed {
            navigationController?.popViewController(animated: true)
        } else {
            let homeVC  = UINavigationController(rootViewController: HomeRouter.createModule())
            let sceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
            sceneDelegate.switchRootViewController(rootViewController: homeVC, animated: true, completion: nil)
        }
    }
}

extension PermissionsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let presenter = presenter else { return 0 }
        return presenter.getPermissionCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return permissionsCollection.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let presenter = presenter else { return UICollectionViewCell() }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PermissionCollectionViewCell.identifier, for: indexPath) as! PermissionCollectionViewCell
        cell.tag = indexPath.row
        cell.setup(model: presenter.getPermissionIn(row: indexPath.row))
        cell.allowFunction = presenter.askForPermission
        cell.denyFunction = presenter.denyAndContinue
        return cell
    }
    
    
}
