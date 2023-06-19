import Foundation

struct TextGPTRequestModel: Encodable{
    
    var model: String = "gpt-3.5-turbo"
    var messages: [TextGPTRequestMessagesModel]
    
}

struct TextGPTRequestMessagesModel: Encodable{
    
    var role: String = "user"
    var content: String
    
}