//
//  WebService.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 07/03/22.
//

import Foundation


class CarService {

    func login(username: String, password: String,  completion: @escaping ([LoginSuccessPostReturn]?) -> ()) {

        let url = URL(string: loginPostAPIAdress)
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"

        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = "username="+username+"&password="+password
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }

                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
        }
        task.resume()

    }


}
