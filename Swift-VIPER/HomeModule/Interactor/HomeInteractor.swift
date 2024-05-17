//
//  HomeInteractor.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

protocol HomeUseCase {
    func getTitle() -> HomeModel
}

class HomeInteractor {
    // db, webservice etc references
}

extension HomeInteractor: HomeUseCase {
    func getTitle() -> HomeModel {
        // get - set HomeModel and pass to presenter, then pass it to viewController
        return HomeModel(title: "Title")
    }
}
