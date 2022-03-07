//
//  Protocols.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 07/03/22.
//

import Foundation

protocol ViewToPresenterMovieProtocol:AnyObject{

    var view: PresenterToViewLoginProtocol? {get set}
    var interactor: PresenterToInteractorLoginProtocol? {get set}
    var router: PresenterToRouterLoginProtocol? {get set}

}

protocol PresenterToViewLoginProtocol:AnyObject {
    func loginSuccessEventDone()
    func loginFailureEventDone()


}

protocol PresenterToRouterLoginProtocol:AnyObject {

    static func createMovieModule()->LoginViewController
    func pushToCarScreen()

}

protocol PresenterToInteractorLoginProtocol:AnyObject {

    var presenter:InteractorToPresenterLoginProtocol? {get set}

}

protocol InteractorToPresenterLoginProtocol:AnyObject {


    func postLogin(loginUser: String, password: String)
    func loginSuccess()
    func loginFailed()

}
