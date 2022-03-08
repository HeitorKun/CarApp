//
//  Router.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 08/03/22.
//

import Foundation
import UIKit


class CarsListRouter: PresenterToRouterCarsListProtocol {

    static func createMovieModule() -> CarsListViewController {

        let CarsStoryboard = UIStoryboard(name: "CarsStoryboard", bundle: nil)
        guard let carsListViewController = CarsStoryboard.instantiateViewController(identifier: "CarsListViewController") as? CarsListViewController else {
            return CarsListViewController()
        }

        let presenter: ViewToPresenterCarsListProtocol & InteractorToPresenterCarsListProtocol = CarsListPresenter()
        let interactor: PresenterToInteractorCarsListProtocol = CarsListInteractor()
        let router:PresenterToRouterCarsListProtocol = CarsListRouter()

        carsListViewController.presenter = presenter
        presenter.view = carsListViewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter



        return carsListViewController

    }

    func pushToCarDetailsScreen() {

    }

}
