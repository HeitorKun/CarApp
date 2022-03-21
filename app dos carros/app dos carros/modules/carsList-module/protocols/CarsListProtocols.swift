//
//  CarsListProtocols.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 08/03/22.
//

import Foundation

protocol ViewToPresenterCarsListProtocol:AnyObject{

    var view: PresenterToViewCarsListProtocol? {get set}
    var interactor: PresenterToInteractorCarsListProtocol? {get set}
    var router: PresenterToRouterCarsListProtocol? {get set}


    func fetchCarsFromInteractor()


}

protocol PresenterToViewCarsListProtocol:AnyObject {

    var presenter: ViewToPresenterCarsListProtocol? { get set }

    func loadTableView()

}

protocol PresenterToRouterCarsListProtocol:AnyObject {

    static func createMovieModule()->CarsListViewController

    func pushToCarDetailsScreen()

}

protocol PresenterToInteractorCarsListProtocol:AnyObject {

    var presenter:InteractorToPresenterCarsListProtocol? {get set}

    func fetchCarList()

}

protocol InteractorToPresenterCarsListProtocol:AnyObject {


}
