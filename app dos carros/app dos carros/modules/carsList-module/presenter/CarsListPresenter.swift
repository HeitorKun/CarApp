//
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 08/03/22.
//

import Foundation

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


}
extension CarsListPresenter : InteractorToPresenterCarsListProtocol {



}
