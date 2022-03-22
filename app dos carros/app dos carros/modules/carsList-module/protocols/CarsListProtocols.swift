//
//  CarsListProtocols.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 08/03/22.
//

import Foundation
import UIKit

protocol ViewToPresenterCarsListProtocol:AnyObject{

    var view: PresenterToViewCarsListProtocol? {get set}
    var interactor: PresenterToInteractorCarsListProtocol? {get set}
    var router: PresenterToRouterCarsListProtocol? {get set}

    func fetchCarsFromInteractor()
    func goToThisCarDetailsScreen(thisCar: CarsListModel)

}

protocol PresenterToViewCarsListProtocol:AnyObject {

    var presenter: ViewToPresenterCarsListProtocol? { get set }

    func receiveCarsData(carList: [CarsListModel])

}

protocol PresenterToRouterCarsListProtocol:AnyObject {

    static func createMovieModule()-> UINavigationController

    func pushToCarDetailsScreen(thisCar: CarsListModel, fromThisViewController: UIViewController)

}

protocol PresenterToInteractorCarsListProtocol:AnyObject {

    var presenter:InteractorToPresenterCarsListProtocol? {get set}

    func fetchCarList(completion: @escaping ([CarsListModel]) ->())

}

protocol InteractorToPresenterCarsListProtocol:AnyObject {


}
