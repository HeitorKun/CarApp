//
//  UserDefaultsHelper.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 09/03/22.
//

import Foundation

protocol SaveTokenAfterLogin {

    func saveToken(token: String)

}

protocol FetchTokenFromMemory {

    func fetchTokenFromMemory() -> String?

}

struct UserDefaultsHelper: SaveTokenAfterLogin, FetchTokenFromMemory {

    func saveToken(token: String) {

        let defaults = UserDefaults.standard
        defaults.set(token, forKey: "token")

    }

    func fetchTokenFromMemory() -> String? {

        let defaults = UserDefaults.standard
        return defaults.string(forKey: "token")

    }


}
