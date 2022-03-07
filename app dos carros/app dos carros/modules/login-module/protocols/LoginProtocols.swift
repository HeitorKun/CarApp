//
//  Protocols.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 07/03/22.
//

import Foundation

protocol ViewToPresenterMovieProtocol:class{

    var view: PresenterToViewLoginProtocol? {get set}
    var interactor: PresenterToInteractorLoginProtocol? {get set}
    var router: PresenterToRouterLoginProtocol? {get set}

}

protocol PresenterToViewLoginProtocol:class {
    func loginSuccessEventDone()
    func loginFailureEventDone()


}

protocol PresenterToRouterLoginProtocol:class {

    static func createMovieModule()->LoginViewController
    func pushToCarScreen()

}

protocol PresenterToInteractorLoginProtocol:class {

    var presenter:PresenterToViewLoginProtocol? {get set}

    func loginPostSuccess()
    func loginPostFailed()

}

protocol InteractorToPresenterLoginProtocol:class {


    func postLogin()

}
