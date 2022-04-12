//
//  CarsListInteractor.swift
//  app dos carros
//
//  Created by Heitor Feijó Kunrath on 08/03/22.
//

import Foundation

class CarsListInteractor: PresenterToInteractorCarsListProtocol {

    weak var presenter: InteractorToPresenterCarsListProtocol?

    private let fetchTokenHelper: FetchTokenFromMemory

    init() {
        self.fetchTokenHelper = UserDefaultsHelper()
    }

    func fetchCarList(completion: @escaping ([CarsListModel]) ->()) {

        var carList: [CarsListModel] = []

        guard let token = fetchTokenHelper.fetchTokenFromMemory() else {
            return    }


        CarService().fetchCarsWithToken(token: token) { carInfosAPIArray in
            guard let carInfosAPIArray = carInfosAPIArray else { return }

            carList = carInfosAPIArray.compactMap { apiInfo in self.nullableCarInfoToCarListModel(APIInfos: apiInfo)
            }
            completion(carList)
        }
    }


    }
    extension CarsListInteractor {

        private func nullableCarInfoToCarListModel(APIInfos: CarInfosSuccessGetReturn ) -> CarsListModel? {

            guard let id = APIInfos.id,
                  let nome = APIInfos.nome,
                  let tipo = APIInfos.tipo,
                  let descricao = APIInfos.descricao,
                  let urlFoto = APIInfos.urlFoto,
                  let urlVideo = APIInfos.urlVideo,
                  let latitude = APIInfos.urlVideo,
                  let longitude = APIInfos.longitude
            else { return nil }

            return CarsListModel(id: id, nome: nome, tipo: tipo, descricao: descricao, urlFoto: urlFoto, urlVideo: urlVideo, latitude: latitude, longitude: longitude)
        }


    }

