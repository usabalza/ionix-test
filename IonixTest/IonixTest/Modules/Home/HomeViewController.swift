//
//  HomeViewController.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//  
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var homeTableView: UITableView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableView()
        guard let presenter = presenter else { return }
        presenter.loadData()
    }
    
    func loadTableView() {
        homeTableView.register(UINib.init(nibName: HomeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.identifier)
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }

    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol?
    
}

extension HomeViewController: PresenterToViewHomeProtocol{
    // TODO: Implement View Output Methods
    func reloadTable() {
        homeTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = presenter else { return 0 }
        return presenter.getMemeCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = presenter else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        cell.setup(model: presenter.getMemeIn(row: indexPath.row).data)
        return cell
    }
    
    
}
