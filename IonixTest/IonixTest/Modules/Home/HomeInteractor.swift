//
//  HomeInteractor.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//  
//

import Foundation

class HomeInteractor: PresenterToInteractorHomeProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterHomeProtocol?
    var service = APIRequest()
    
    func getMemeIn(after: String?) {
        service.getAllMemes(after: after) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let model):
                self.presenter?.fetchMemeArray(model: model)
            case .failure(let error):
                self.presenter?.showAlert(error: error.error)
            }
        }
    }
    
    func searchText(text: String, after: String?) {
        service.searchText(text: text, after: after) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let model):
                self.presenter?.fetchMemeArray(model: model)
            case .failure(let error):
                self.presenter?.showAlert(error: error.error)
            }
        }
    }
}
