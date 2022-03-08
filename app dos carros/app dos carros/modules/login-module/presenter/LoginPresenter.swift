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

    func loginRequest(loginUser: String, password: String) {
        if loginUser == "" && password == "" {
            view?.pleaseCompleteFieldsUIAlert()
        }
        else {
            interactor?.postLogin(loginUser: loginUser, password: password)
        }
    }

}

extension LoginPresenter: InteractorToPresenterLoginProtocol {

    func loginSuccess() {

    }

    func loginFailed() {


    }

}
