//
//  TodoModel.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

struct Todo: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
