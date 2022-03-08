//
//  LoginSuccessPostReturn.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 07/03/22.
//

import Foundation


struct LoginSuccessPostReturn: Decodable {

    var id: Int
    var login: String
    var nome: String
    var email: String
    var urlFoto: String
    var token: String
    var roles: [String]

}

struct LoginFailurePostReturn: Decodable {

    var error: String

}

