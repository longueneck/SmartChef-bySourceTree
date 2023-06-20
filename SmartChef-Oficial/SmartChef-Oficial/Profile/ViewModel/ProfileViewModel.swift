//
//  ProfileViewModel.swift
//  SmartChef-Oficial
//
//  Created by Sergio Silva Macedo on 19/06/23.
//

import UIKit
import Firebase
import FirebaseAuth

protocol ProfileViewModelProtocol : AnyObject {
    func sucess()
    func Failure()
}

class ProfileViewModel {

    private var db = Firestore.firestore()
    private var auth: Auth = Auth.auth()
    private var idUser : String?
    private var nameUser : String?
    private var userData : User?
    private weak var delegate :ProfileViewModelProtocol?
    
    public func delegate(delegate :ProfileViewModelProtocol?){
        self.delegate = delegate
    }

    public func loadCurrentUser(){
        
        if let currentUser = auth.currentUser {
            self.idUser = currentUser.uid
        }
    
        self.db.collection("user").document(self.idUser ?? "").getDocument(completion: {
            result, error in
            if error != nil {
                self.delegate?.Failure()
            }
            if let result = result{
                self.userData = User(dicionario: result.data() ?? [:])
                self.nameUser = self.userData?.nome ?? ""
                self.delegate?.sucess()
                
            }
        })
    }
    
    public var setNameUser: String{
        self.nameUser ?? ""
    }
}
