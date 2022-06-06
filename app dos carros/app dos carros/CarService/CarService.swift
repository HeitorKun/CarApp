//
//  WebService.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 07/03/22.
//

import Foundation


protocol LoginProtocol {
    func login(username: String, password: String,  completion: @escaping (LoginSuccessPostReturn?) -> ())
}

protocol FetchCarsWithTokenProtocol {
    func fetchCarsWithToken(token: String, completion: @escaping ([CarInfosSuccessGetReturn]?) -> ())
}

protocol CarServiceProtocol: LoginProtocol & FetchCarsWithTokenProtocol{
    func login(username: String, password: String,  completion: @escaping (LoginSuccessPostReturn?) -> ())
    func fetchCarsWithToken(token: String, completion: @escaping ([CarInfosSuccessGetReturn]?) -> ())

}

class CarService: CarServiceProtocol {

    func login(username: String, password: String,  completion: @escaping (LoginSuccessPostReturn?) -> ()) {

        let url = URL(string: loginPostAPIAdress)
        guard let requestUrl = url else { completion(nil)
            return }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"

        let body = ["username": username,
                    "password": password]
        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )
        request.httpBody = bodyData

        request.addValue("application/json", forHTTPHeaderField: "content-type")

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            if error != nil {
                completion(nil)
                return
            }

            if let data = data {
                if let loginSuccessPostReturnStruct = try? JSONDecoder().decode(LoginSuccessPostReturn.self, from: data) {
                    completion(loginSuccessPostReturnStruct)
                } else {
                    completion(nil)
                }

            }
        }
        task.resume()

    }

    func fetchCarsWithToken(token: String, completion: @escaping ([CarInfosSuccessGetReturn]?) -> ()) {

        guard let url = URL(string: carrosListGetAPIAdress) else {return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "Host": "carros-springboot.herokuapp.com",
            "Authorization": "Bearer \(token)"
        ]

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(nil)
                return }

            if let data = data {

                if let carInfosList = try? JSONDecoder().decode([CarInfosSuccessGetReturn].self, from: data) {

                    completion(carInfosList)
                } else {
                    completion(nil)
                }

            }

            completion(nil)
        }.resume()

    }

}


