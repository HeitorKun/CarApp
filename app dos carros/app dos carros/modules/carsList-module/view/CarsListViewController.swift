//
//  CarsListViewController.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 08/03/22.
//

import UIKit

class CarsListViewController: UIViewController, PresenterToViewCarsListProtocol {

    var presenter: ViewToPresenterCarsListProtocol?
    @IBOutlet weak var carsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        carsTableView.dataSource = self
        carsTableView.delegate = self

    }

    func loadTableView() {

        carsTableView.reloadData()
    }

}
extension CarsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }


}
