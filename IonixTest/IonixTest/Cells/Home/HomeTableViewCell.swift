//
//  HomeTableViewCell.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCell"

    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var memeImage: UIImageView!

    @IBOutlet weak var memeTitle: UILabel!

    @IBOutlet weak var memeVotes: UILabel!

    @IBOutlet weak var memeComments: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCellView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(model: Meme) {
        guard let url = URL(string: model.url) else { return }
        memeImage.kf.setImage(with: url)
        memeTitle.text = model.title
        memeVotes.text = "\(model.score)"
        memeComments.text = "\(model.numComments)"
    }

    func setupCellView() {
        containerView.layer.cornerRadius = 16
        memeImage.layer.cornerRadius = 16
        containerView.clipsToBounds = false
        containerView.addShadow(color: UIColor.black, opacity: 0.4, offset: CGSize(width: 0, height: 4), radius: 8)
    }
}
