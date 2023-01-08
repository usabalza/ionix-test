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

    func loadData() {
        memeArray = []
        paginationAfter = nil
        interactor?.getMemeIn(after: nil)
    }

    func loadMoreData(text: String) {
        if isSearchEmpty {
            interactor?.getMemeIn(after: paginationAfter)
        } else {
            interactor?.searchText(text: text, after: paginationAfter)
        }

    }

    func getMemeCount() -> Int {
        return isSearchEmpty ? memeArray.count : searchArray.count
    }

    func getMemeIn(row: Int) -> BaseMeme {
        return isSearchEmpty ? memeArray[row] : searchArray[row]
    }

    func searchText(text: String) {
        paginationAfter = nil
        isSearchEmpty = text.isEmpty
        searchArray = []
        interactor?.searchText(text: text, after: paginationAfter)
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func fetchMemeArray(model: BaseData) {
        if isSearchEmpty {
            memeArray.append(contentsOf: model.data.children.filter {
                $0.data.linkFlairText == "Shitposting" && $0.data.postHint == "image"
            })
        } else {
            searchArray.append(contentsOf: model.data.children.filter {
                $0.data.linkFlairText == "Shitposting" && $0.data.postHint == "image"
            })
        }
        paginationAfter = model.data.after
        view?.reloadTable()
    }

    func showAlert(error: String) {
        view?.showSystemAlert(title: "Error", message: error, completion: nil)
    }

}
