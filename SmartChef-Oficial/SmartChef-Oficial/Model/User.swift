//
//  UserData.swift
//  SmartChef-Oficial
//
//  Created by Sergio Silva Macedo on 19/06/23.
//

import UIKit

struct User {
    
    var nome:String?
    var email:String?
    
    init(dicionario:[String:Any]){
        self.nome = dicionario["nome"] as? String
        self.email = dicionario["email"] as? String
    }
}
