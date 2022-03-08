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

    func loginRequest(loginUser: String, password: String)

}

protocol PresenterToViewLoginProtocol:AnyObject {

    var presenter: ViewToPresenterMovieProtocol? { get set }

    func pleaseCompleteFieldsUIAlert()
    func loginSuccessEventDone()
    func loginFailureEventDone()

}

protocol PresenterToRouterLoginProtocol:AnyObject {

    static func createMovieModule()->LoginViewController
    func pushToCarScreen()

}

protocol PresenterToInteractorLoginProtocol:AnyObject {

    var presenter:InteractorToPresenterLoginProtocol? {get set}
    
    func postLogin(loginUser: String, password: String)

}

protocol InteractorToPresenterLoginProtocol:AnyObject {

    func loginSuccess()
    func loginFailed()

}
