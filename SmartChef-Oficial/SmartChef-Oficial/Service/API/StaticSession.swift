import UIKit

class StaticSession{
    
    static var configuration: URLSessionConfiguration{
            let config = URLSessionConfiguration.default

        return config
    }
    
    static var session: URLSession = URLSession(configuration: configuration)
    
    static var baseURL = "http://localhost:4002/"
    
}
