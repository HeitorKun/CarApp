//
//  CarsListViewController.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 08/03/22.
//

import UIKit

class CarsListViewController: UIViewController, PresenterToViewCarsListProtocol {

    var presenter: ViewToPresenterCarsListProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()


    }

}
extension CarsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }


}
