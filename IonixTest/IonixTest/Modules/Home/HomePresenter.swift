//
//  HomePresenter.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//  
//

import Foundation

class HomePresenter: ViewToPresenterHomeProtocol {

    var memeArray: [BaseMeme] = []
    var searchArray: [BaseMeme] = []
    var isSearchEmpty: Bool = true

    // MARK: Properties
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
    var paginationAfter: String?

    // Initial load of data
    func loadData() {
        memeArray = []
        paginationAfter = nil
        interactor?.getMemeIn(after: nil)
    }

    // Adds more results to array with pagination and infinite scroll
    func loadMoreData(text: String) {
        if isSearchEmpty {
            interactor?.getMemeIn(after: paginationAfter)
        } else {
            interactor?.searchText(text: text, after: paginationAfter)
        }
    }

    // Get the count of meme array, with and without search
    func getMemeCount() -> Int {
        return isSearchEmpty ? memeArray.count : searchArray.count
    }

    // Get the specific model for row
    func getMemeIn(row: Int) -> BaseMeme {
        return isSearchEmpty ? memeArray[row] : searchArray[row]
    }

    // Search text calling the endpoint
    func searchText(text: String) {
        paginationAfter = nil
        isSearchEmpty = text.isEmpty
        searchArray = []
        interactor?.searchText(text: text, after: paginationAfter)
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    // Fetch the results from the API
    func fetchMemeArray(model: BaseData) {
        if isSearchEmpty {
            memeArray.append(contentsOf: model.data.children.filter {
                $0.data.linkFlairText == "Shitposting" && $0.data.postHint == "image"
            })
        } else {
            searchArray = model.data.children.filter {
                $0.data.linkFlairText == "Shitposting" && $0.data.postHint == "image"
            }
        }
        paginationAfter = model.data.after
        view?.reloadTable()
    }

    // Retrieves the network error if any
    func showAlert(error: String) {
        view?.showSystemAlert(title: "Error", message: error, completion: nil)
    }

}
