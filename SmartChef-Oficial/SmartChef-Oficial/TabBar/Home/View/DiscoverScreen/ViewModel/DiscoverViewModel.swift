//
//  DiscoverViewModel.swift
//  SmartChef-Oficial
//
//  Created by Gabriel Mors  on 26/04/23.
//

import UIKit

class DiscoverViewModel {
    
    private var listImages: [DiscoverModel] = [
                                       DiscoverModel(nameImage: "pao"),
                                       DiscoverModel(nameImage: "pao"),
                                       DiscoverModel(nameImage: "pao"),
                                       DiscoverModel(nameImage: "pao"),
                                       DiscoverModel(nameImage: "pao"),
                                       DiscoverModel(nameImage: "pao"),
                                       DiscoverModel(nameImage: "pao"),
                                       DiscoverModel(nameImage: "pao"),
                                       DiscoverModel(nameImage: "pao"),
                                       DiscoverModel(nameImage: "pao"),
                                       DiscoverModel(nameImage: "pao")
    ]
    
    
    public func getListImages() -> Int {
        listImages.count
    }
    
    public func getListCell(index: Int) -> DiscoverModel {
        listImages[index]
    }
    
    //    public func setSize() -> CGSize {
    //        return CGSize(width: self.view.frame.width * 0.98, height: 100)
    //    }
    
}





