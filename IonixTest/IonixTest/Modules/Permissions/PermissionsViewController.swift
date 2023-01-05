//
//  PermissionsViewController.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//  
//

import UIKit

class PermissionsViewController: UIViewController {
    
    @IBOutlet weak var permissionsCollection: UICollectionView!
    
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
        cell.setup(model: presenter.getPermissionIn(row: indexPath.row))
        return cell
    }
    
    
}
