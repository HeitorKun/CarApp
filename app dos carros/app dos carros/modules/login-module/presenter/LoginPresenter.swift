//
//  LoginPresenter.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 07/03/22.
//

import Foundation


class LoginPresenter: ViewToPresenterMovieProtocol {
    var view: PresenterToViewLoginProtocol?

    var interactor: PresenterToInteractorLoginProtocol?

    var router: PresenterToRouterLoginProtocol?

}

extension LoginPresenter: InteractorToPresenterLoginProtocol {

    func postLogin(loginUser: String, password: String) {
        postLogin(loginUser: loginUser, password: password)
    }

    func loginSuccess() {

    }

    func loginFailed() {


    }

}
