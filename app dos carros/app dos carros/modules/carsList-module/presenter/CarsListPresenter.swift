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


}
extension CarsListPresenter : InteractorToPresenterCarsListProtocol {



}
