import Foundation

struct TextGPTResponseModel: Decodable {

    var choices: [TextGPTResponseChoicesModel]
    
}

struct TextGPTResponseChoicesModel: Decodable {
    
    var message: TextGPTResponseMessagesModel
    
}

struct TextGPTResponseMessagesModel: Decodable {
    
    var content: String
    
}
