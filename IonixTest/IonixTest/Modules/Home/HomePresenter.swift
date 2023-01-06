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
    
    func loadData() {
        interactor?.getMemeIn()
    }
    
    func getMemeCount() -> Int {
        return memeArray.count
    }
    
    func getMemeIn(row: Int) -> BaseMeme {
        return memeArray[row]
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func fetchMemeArray(model: [BaseMeme]) {
        memeArray = model.filter { $0.data.linkFlairText == "Shitposting" && $0.data.postHint == "image"}
        view?.reloadTable()
    }
    
    func showAlert(error: String) {
        print(error)
    }
    
}
