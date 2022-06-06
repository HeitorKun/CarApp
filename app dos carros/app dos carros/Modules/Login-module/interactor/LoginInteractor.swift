//
//  loginInteractor.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 07/03/22.
//

import Foundation



class LoginInteractor: PresenterToInteractorLoginProtocol {

    weak var presenter: InteractorToPresenterLoginProtocol?

    private var loginService: LoginProtocol

    init(loginService :LoginProtocol = CarService()) {
        self.loginService = loginService
    }

    func postLogin(loginUser: String, password: String) {

        loginService.login(username: loginUser, password: password) { postReturn in

            if postReturn == nil {
                DispatchQueue.main.async { [weak self] in
                    self?.presenter?.loginFailed()
                }
            }
            else {
                let loginModel = LoginModel(token: postReturn?.token ?? "")
                DispatchQueue.main.async { [weak self] in
                    self?.presenter?.loginSuccess(loginModel: loginModel)
                }
            }
        }

    }

}
