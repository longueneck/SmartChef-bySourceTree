import Foundation

struct ImageGPTResponseModel: Decodable {

    var data: [ImageGPTResponseChoicesModel]
    
}

struct ImageGPTResponseChoicesModel: Decodable {
    
    var url: String
    
}


