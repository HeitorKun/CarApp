//
//  SelectedCarPresenter.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 22/03/22.
//

import Foundation


class SelectedCarPresenter: InteractorToPresenterSelectedCarProtocol, ViewToPresenterSelectedCarProtocol  {
    
    var view: PresenterToViewSelectedCarProtocol?

    var interactor: PresenterToInteractorSelectedCarProtocol?

    var router: PresenterToRouterSelectedCarProtocol?

    func getUrlForView() -> String {
        return interactor?.getSelectedCarData().urlFoto ?? ""
    }


}
