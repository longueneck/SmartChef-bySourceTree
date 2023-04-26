//
//  DiscoverViewModel.swift
//  SmartChef-Oficial
//
//  Created by Gabriel Mors  on 26/04/23.
//

import UIKit

class DiscoverViewModel {
    
    private var listImages: [DiscoverModel] = [
        DiscoverModel(nameRecipe: "Pão", nameImage: "pao"),
        DiscoverModel(nameRecipe: "Arroz Caseiro", nameImage: "arrozDiferente"),
        DiscoverModel(nameRecipe: "Peixe no Formo", nameImage: "peixe"),
        DiscoverModel(nameRecipe: "Salada Completa", nameImage: "salada"),
        DiscoverModel(nameRecipe: "Pão", nameImage: "pao"),
        DiscoverModel(nameRecipe: "Arroz Caseiro", nameImage: "arrozDiferente"),
        DiscoverModel(nameRecipe: "Peixe no Formo", nameImage: "peixe"),
        DiscoverModel(nameRecipe: "Salada Completa", nameImage: "salada"),
        DiscoverModel(nameRecipe: "Pão", nameImage: "pao"),
        DiscoverModel(nameRecipe: "Arroz Caseiro", nameImage: "arrozDiferente"),
        DiscoverModel(nameRecipe: "Peixe no Formo", nameImage: "peixe"),
        DiscoverModel(nameRecipe: "Salada Completa", nameImage: "salada"),
    ]
    
    public func getListImages() -> Int {
        listImages.count
    }
    
    public func getListCell(index: Int) -> DiscoverModel {
        listImages[index]
    }

}





