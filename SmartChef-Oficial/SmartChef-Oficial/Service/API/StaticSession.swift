import Foundation

class StaticSession{
    
    static var configuration: URLSessionConfiguration{
            let config = URLSessionConfiguration.default
//        config.httpAdditionalHeaders = ["":""]
        return config
    }
    
    static var session: URLSession = URLSession(configuration: configuration)
    
    static var baseURL = "http://localhost:4002/"
    
}
