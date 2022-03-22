//
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 08/03/22.
//

import Foundation
import UIKit

class CarsListPresenter : ViewToPresenterCarsListProtocol {

    var view: PresenterToViewCarsListProtocol?

    var interactor: PresenterToInteractorCarsListProtocol?

    var router: PresenterToRouterCarsListProtocol?

    func fetchCarsFromInteractor() {

        interactor?.fetchCarList(completion: { carList in

            DispatchQueue.main.sync { [weak self] in
                self?.view?.receiveCarsData(carList: carList)
            }
        })

    }

    func goToThisCarDetailsScreen(thisCar: CarsListModel) {

        router?.pushToCarDetailsScreen(thisCar: thisCar, fromThisViewController: view as! UIViewController)
    }

}
extension CarsListPresenter : InteractorToPresenterCarsListProtocol {

}
