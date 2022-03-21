//
//  app_dos_carrosTests.swift
//  app dos carrosTests
//
//  Created by Heitor Feijó Kunrath on 21/03/22.
//

import XCTest
import app_dos_carros



class app_dos_carrosTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {


        class heitorTest: InteractorToPresenterLoginProtocol {
            let loginInteractor = LoginInteractor()

            init() {
                loginInteractor.presenter = self
                loginInteractor.postLogin(loginUser: "user", password: "123")
            }

            func loginSuccess(loginModel: LoginModel) {
                XCTAssert(loginModel.token.count != 0 )
            }

            func loginFailed() {
                
            }

        }





    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}



