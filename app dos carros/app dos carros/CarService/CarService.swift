//
//  WebService.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 07/03/22.
//

import Foundation


class CarService {

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

            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                let loginSuccessPostReturnStruct = try? JSONDecoder().decode(LoginSuccessPostReturn.self, from: data)
                completion(loginSuccessPostReturnStruct)
            }
        }
        task.resume()
        
    }

}
