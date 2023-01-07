//
//  LoaderTableViewCell.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 6/1/23.
//

import UIKit

class LoaderTableViewCell: UITableViewCell {
    
    static let identifier = "LoaderTableViewCell"
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func startAnimating() {
        loader.startAnimating()
    }
    
    func stopAnimating() {
        loader.stopAnimating()
    }
    
}
