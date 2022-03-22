//
//  loginInteractor.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 07/03/22.
//

import Foundation



class LoginInteractor: PresenterToInteractorLoginProtocol {

    var presenter: InteractorToPresenterLoginProtocol?

    func postLogin(loginUser: String, password: String) {

        CarService().login(username: loginUser, password: password) { postReturn in

            if postReturn == nil {
                DispatchQueue.main.sync { [weak self] in
                    self?.presenter?.loginFailed()
                }
            }
            else {
                let loginModel = LoginModel(token: postReturn?.token ?? "")
                DispatchQueue.main.sync { [weak self] in
                    self?.presenter?.loginSuccess(loginModel: loginModel)
                }
            }
        }

    }

}
