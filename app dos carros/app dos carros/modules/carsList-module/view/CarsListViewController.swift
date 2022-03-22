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

    var carList: [CarsListModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        carsTableView.dataSource = self
        carsTableView.delegate = self
        presenter?.fetchCarsFromInteractor()

    }

    func receiveCarsData(carList: [CarsListModel]) {
        self.carList = carList
        carsTableView.reloadData()
    }

}
extension CarsListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = carsTableView.dequeueReusableCell(withIdentifier: "CarListTableViewCell") as? CarListTableViewCell else { return UITableViewCell() }

        cell.carImageView.loadFrom(URLAddress: carList[indexPath.row].urlFoto)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        presenter?.goToThisCarDetailsScreen(thisCar: carList[indexPath.row])
        
    }


}
