//
//  LoginRouter.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 08/03/22.
//

import Foundation
import UIKit


class LoginRouter: PresenterToRouterLoginProtocol {
    
    static func createMovieModule() -> LoginViewController {

        let InitialStoryboard = UIStoryboard(name: "InitialStoryboard", bundle: nil)
        guard let loginViewController = InitialStoryboard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else {
            return LoginViewController()
        }

        let presenter: ViewToPresenterMovieProtocol & InteractorToPresenterLoginProtocol = LoginPresenter()
        let interactor: PresenterToInteractorLoginProtocol = LoginInteractor()
        let router:PresenterToRouterLoginProtocol = LoginRouter()

        loginViewController.presenter = presenter
        presenter.view = loginViewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter



        return loginViewController
    }

    func pushToCarScreen() {


    }

}
