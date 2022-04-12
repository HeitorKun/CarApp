//
//  SelectedCarInteractor.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 22/03/22.
//

import Foundation



class SelectedCarInteractor: PresenterToInteractorSelectedCarProtocol {
    
    weak var presenter: InteractorToPresenterSelectedCarProtocol?

    private var selectedCarListModel: CarsListModel

    init(selectedCarListModel: CarsListModel) {
        self.selectedCarListModel = selectedCarListModel
    }

    func getSelectedCarData() -> SelectedCarModel {

        return SelectedCarModel(nome: selectedCarListModel.nome, urlFoto: selectedCarListModel.urlFoto, urlVideo: selectedCarListModel.urlVideo, latitude: selectedCarListModel.latitude, longitude: selectedCarListModel.longitude)
    }


}
