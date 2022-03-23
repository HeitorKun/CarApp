//
//  Router.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 08/03/22.
//

import Foundation
import UIKit


class CarsListRouter: PresenterToRouterCarsListProtocol {

    static func createMovieModule() -> UINavigationController {

        let carsStoryboard = UIStoryboard(name: "CarsStoryboard", bundle: nil)
        let initialNavigationController = carsStoryboard.instantiateInitialViewController() as? UINavigationController

        guard let carsListViewController = initialNavigationController?.topViewController  as? CarsListViewController else {
            return UINavigationController()
        }

        let presenter: ViewToPresenterCarsListProtocol & InteractorToPresenterCarsListProtocol = CarsListPresenter()
        let interactor: PresenterToInteractorCarsListProtocol = CarsListInteractor()
        let router:PresenterToRouterCarsListProtocol = CarsListRouter()

        carsListViewController.presenter = presenter
        presenter.view = carsListViewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter



        return initialNavigationController ?? UINavigationController()

    }

    func pushToCarDetailsScreen(thisCar: CarsListModel, fromThisViewController: UIViewController) {

        let selectedCarViewController = SelectedCarRouter.createMovieModule(thisSelectedCarData: thisCar)
        fromThisViewController.navigationController?.pushViewController(selectedCarViewController, animated: true)

    }

}
