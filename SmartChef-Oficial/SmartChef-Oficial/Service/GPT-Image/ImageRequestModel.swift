import Foundation

struct ImageRequestModel: Encodable{
    
    var prompt: String 
    var n: Int = 2
    var size: String = "512x512"
}

