//
//  HomeViewController.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//  
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var emptyView: UIView!

    @IBOutlet weak var searchTextField: UITextField!

    @IBOutlet weak var homeTableView: UITableView!

    let refreshControl = UIRefreshControl()

    var isLoading: Bool = false

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Config",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(goToConfig))
        loadTableView()
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        searchTextField.delegate = self
        guard let presenter = presenter else { return }
        presenter.loadData()
    }

    // Code to load the current tableView
    private func loadTableView() {
        homeTableView.register(
            UINib.init(nibName: HomeTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: HomeTableViewCell.identifier
        )
        homeTableView.register(
            UINib.init(nibName: LoaderTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: LoaderTableViewCell.identifier
        )
        homeTableView.delegate = self
        homeTableView.dataSource = self
        addPushToRefresh()
    }

    // Push to refresh for tableView
    private func addPushToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        homeTableView.addSubview(refreshControl)
    }

    // MARK: - ObjectiveC Functions

    // Code to refresh table view
    @objc func refresh(_ sender: AnyObject) {
        guard let presenter = presenter else { return }
        presenter.loadData()
    }

    // This function calls the search endpoint each time the text changes.
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let presenter = presenter else { return }
        presenter.searchText(text: textField.text ?? "")
    }

    // Push to the PermissionsViewController
    @objc func goToConfig() {
        let viewController = PermissionsRouter.createModule(isPushed: true)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol?

}

extension HomeViewController: PresenterToViewHomeProtocol {
    // MARK: - Implement View Output Methods

    // Reloads the current table
    func reloadTable() {
        homeTableView.reloadData()
        refreshControl.endRefreshing()
    }

    // Shows the native alert
    func showSystemAlert(title: String, message: String, completion: (() -> Void)?) {
        showAlert(alertModel: Alert(title: title, message: message, then: completion))
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = presenter else { return 0 }
        switch section {
        case 0:
            emptyView.isHidden = presenter.getMemeCount() > 0
            return presenter.getMemeCount()
        case 1: return 1
        default: return 0
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return UITableView.automaticDimension
        case 1: return 40
        default: return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = presenter else { return UITableViewCell() }
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
            cell.setup(model: presenter.getMemeIn(row: indexPath.row).data)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: LoaderTableViewCell.identifier, for: indexPath) as! LoaderTableViewCell
            cell.startAnimating()
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let presenter = presenter else { return }
        if indexPath.row == presenter.getMemeCount() - 1, !isLoading {
            presenter.loadMoreData(text: searchTextField.text ?? "")
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view?.endEditing(true)
        return false
    }
}
