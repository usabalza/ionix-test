//
//  HomeContract.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//  
//

import Foundation

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol {
    func reloadTable()
    func showSystemAlert(title: String, message: String, completion: (() -> Void)?)
}

// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol {

    var view: PresenterToViewHomeProtocol? { get set }
    var interactor: PresenterToInteractorHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }

    func loadData()
    func loadMoreData(text: String)
    func getMemeCount() -> Int
    func getMemeIn(row: Int) -> BaseMeme
    func searchText(text: String)
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol {

    var presenter: InteractorToPresenterHomeProtocol? { get set }
    func getMemeIn(after: String?)
    func searchText(text: String, after: String?)
}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol {
    func fetchMemeArray(model: BaseData)
    func showAlert(error: String)
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol {

}
