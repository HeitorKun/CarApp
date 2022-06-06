//
//  app_dos_carrosTests.swift
//  app dos carrosTests
//
//  Created by Heitor Feijó Kunrath on 21/03/22.
//

import XCTest
import app_dos_carros



class app_dos_carrosTests: XCTestCase {



    class loginInteractorToPresenterLoginProtocolTestClass: InteractorToPresenterLoginProtocol {

        var successLoginVar: Bool?
        var failedLoginVar: Bool?
        var expectation:XCTestExpectation

        init(expectation:XCTestExpectation) {
            self.expectation = expectation
        }

        func loginSuccess(loginModel: LoginModel) {
            DispatchQueue.main.asyncAfter(deadline: .now()+1) { [weak self] in
                self?.successLoginVar = true
                self?.expectation.fulfill()
            }
        }

        func loginFailed() {
            DispatchQueue.main.asyncAfter(deadline: .now()+1){ [weak self] in
                self?.failedLoginVar = false
                self?.expectation.fulfill()
            }
        }

    }

    class loginSuccessServiceMockForTestClass:LoginProtocol  {
        func login(username: String, password: String, completion: @escaping (LoginSuccessPostReturn?) -> ()) {
            completion(LoginSuccessPostReturn(id: 123, login: "user", nome: "john", email: "john@john.com", urlFoto: "", token: "123456", roles: []))
        }
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginInteractor() throws {

        let a = Log
        let loginFinishedExpectation = expectation(description: "finished Login, presenter called")
        let loginInteractor = LoginInteractor(loginService: loginSuccessServiceMockForTestClass())
        let loginInteractorPresenterProtocol =  loginInteractorToPresenterLoginProtocolTestClass(expectation: loginFinishedExpectation)
        loginInteractor.presenter = loginInteractorPresenterProtocol

        loginInteractor.postLogin(loginUser: "user", password: "123")

        wait(for: [loginFinishedExpectation], timeout: 3)

        XCTAssertEqual((loginInteractorPresenterProtocol.successLoginVar),true)


    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }


}
