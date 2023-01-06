//
//  HomeContract.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol {
   func reloadTable()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol {
    
    var view: PresenterToViewHomeProtocol? { get set }
    var interactor: PresenterToInteractorHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }
    
    func loadData()
    func getMemeCount() -> Int
    func getMemeIn(row: Int) -> BaseMeme
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol {
    
    var presenter: InteractorToPresenterHomeProtocol? { get set }
    func getMemeIn()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol {
    func fetchMemeArray(model: [BaseMeme])
    func showAlert(error: String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol {
    
}
