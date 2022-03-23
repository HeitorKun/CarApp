//
//  SelectedCarRouter.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 22/03/22.
//

import Foundation
import UIKit

class SelectedCarRouter: PresenterToRouterSelectedCarProtocol {

    static func createMovieModule(thisSelectedCarData: CarsListModel) -> SelectedCarViewController {

        let selectedCarStoryboard = UIStoryboard(name: "SelectedCarStoryboard", bundle: nil)

        guard let selectedCarViewController = selectedCarStoryboard.instantiateInitialViewController() as? SelectedCarViewController else { return SelectedCarViewController()  }


        let presenter: ViewToPresenterSelectedCarProtocol & InteractorToPresenterSelectedCarProtocol = SelectedCarPresenter()
        let interactor: PresenterToInteractorSelectedCarProtocol = SelectedCarInteractor(selectedCarListModel: thisSelectedCarData)
        let router:PresenterToRouterSelectedCarProtocol = SelectedCarRouter()

        selectedCarViewController.presenter = presenter
        presenter.view = selectedCarViewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return selectedCarViewController

    }


}
