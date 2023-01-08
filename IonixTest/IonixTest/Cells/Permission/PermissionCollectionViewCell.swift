//
//  PermissionCollectionViewCell.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//

import UIKit

class PermissionCollectionViewCell: UICollectionViewCell {

    static let identifier = "PermissionCollectionViewCell"

    @IBOutlet weak var permissionImage: UIImageView!

    @IBOutlet weak var permissionName: UILabel!

    @IBOutlet weak var permissionDescription: UILabel!

    @IBOutlet weak var permissionAllowButton: UIButton!

    @IBOutlet weak var permissionDenyButton: UIButton!

    var primaryColor: UIColor = UIColor.init(named: "primary")!
    var secondaryColor: UIColor = UIColor.init(named: "secondary")!
    var tertiaryColor: UIColor = UIColor.init(named: "tertiary")!
    var allowFunction: ((Int) -> Void)?
    var denyFunction: ((Int) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        setupButtons()
    }

    func setupButtons() {
        permissionAllowButton.layer.cornerRadius = 24
        permissionAllowButton.applyGradient(colors: [
            primaryColor.cgColor,
            secondaryColor.cgColor,
            tertiaryColor.cgColor
        ])
        permissionAllowButton.clipsToBounds = true
        permissionAllowButton.setTitleColor(.white, for: .normal)
        permissionDenyButton.setTitleColor(.gray, for: .normal)
    }

    func setup(model: Permission) {
        permissionName.text = model.name
        permissionDescription.text = model.description
        permissionImage.image = UIImage(named: model.image)
        permissionAllowButton.setTitle(model.allowTitle, for: .normal)
        permissionDenyButton.setTitle(model.denyTitle, for: .normal)
    }

    @IBAction func allowAction(_ sender: UIButton) {
        allowFunction?(self.tag)
    }

    @IBAction func denyAction(_ sender: UIButton) {
        denyFunction?(self.tag)
    }
}
