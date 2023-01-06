//
//  HomePresenter.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//  
//

import Foundation

class HomePresenter: ViewToPresenterHomeProtocol {
    
    var memeArray: [Meme] = []

    // MARK: Properties
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
    
    func getMemeCount() -> Int {
        return memeArray.count
    }
    
    func getMemeIn(row: Int) -> Meme {
        return memeArray[row]
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    
}
