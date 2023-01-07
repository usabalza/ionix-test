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
    
    func loadMoreData() {
        interactor?.getMemeIn(after: paginationAfter)
    }
    
    func getMemeCount() -> Int {
        return memeArray.count
    }
    
    func getMemeIn(row: Int) -> BaseMeme {
        return memeArray[row]
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func fetchMemeArray(model: BaseData) {
        memeArray.append(contentsOf: model.data.children.filter { $0.data.linkFlairText == "Shitposting" && $0.data.postHint == "image" })
        paginationAfter = model.data.after
        view?.reloadTable()
    }
    
    func showAlert(error: String) {
        print(error)
    }
    
}
