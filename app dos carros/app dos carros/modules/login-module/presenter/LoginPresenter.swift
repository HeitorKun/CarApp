//
//  LoginPresenter.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 07/03/22.
//

import Foundation
import UIKit

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

    func loginDoneViewReadyForNavigation() {
        router?.pushToCarScreen(viewController: view as! UIViewController)
    }

}

extension LoginPresenter: InteractorToPresenterLoginProtocol {

    func loginSuccess() {
        view?.loginSuccessEventDone()
    }

    func loginFailed() {
        view?.loginFailureEventDone()

    }

}
