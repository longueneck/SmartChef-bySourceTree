//
//  FavoriteViewModel.swift
//  SmartChef-Oficial
//
//  Created by Gabriel Mors  on 26/04/23.
//

import UIKit

class FavoriteViewModel {
    
    private var listFavoriteRecipe: [FavoriteRecipe] = [FavoriteRecipe(image: "expresso", name: "Receitas Favoritadas"),
                                                        FavoriteRecipe(image: "expresso", name: "Receitas Favoritadas"),
                                                        FavoriteRecipe(image: "expresso", name: "Receitas Favoritadas"),
                                                        FavoriteRecipe(image: "expresso", name: "Receitas Favoritadas"),
                                                        FavoriteRecipe(image: "expresso", name: "Receitas Favoritadas"),
                                                        FavoriteRecipe(image: "expresso", name: "Receitas Favoritadas"),
                                                        FavoriteRecipe(image: "expresso", name: "Receitas Favoritadas"),
    
    ]
    
    public var numberOfItemsInSection: Int {
        listFavoriteRecipe.count
    }
    
    public func cellForItemAt(index: Int) -> FavoriteRecipe {
        listFavoriteRecipe[index]
    }
}
