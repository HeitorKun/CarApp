//
//  SelectedCarsProtocol.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 22/03/22.
//

import Foundation

protocol ViewToPresenterSelectedCarProtocol:AnyObject{

    var view: PresenterToViewSelectedCarProtocol? {get set}
    var interactor: PresenterToInteractorSelectedCarProtocol? {get set}
    var router: PresenterToRouterSelectedCarProtocol? {get set}

    func getUrlForView() -> String

}

protocol PresenterToViewSelectedCarProtocol:AnyObject {

    var presenter: ViewToPresenterSelectedCarProtocol? { get set }


}

protocol PresenterToRouterSelectedCarProtocol:AnyObject {

    static func createMovieModule(thisSelectedCarData: CarsListModel) -> SelectedCarViewController

}

protocol PresenterToInteractorSelectedCarProtocol:AnyObject {

    var presenter:InteractorToPresenterSelectedCarProtocol? {get set}

    func getSelectedCarData() -> SelectedCarModel

}

protocol InteractorToPresenterSelectedCarProtocol:AnyObject {


}

