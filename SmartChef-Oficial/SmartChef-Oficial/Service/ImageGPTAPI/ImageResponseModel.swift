import Foundation

struct ImageResponseModel: Decodable {

    var data: [ImageResponseChoicesModel]
    
}

struct ImageResponseChoicesModel: Decodable {
    
    var url: String
    
}



