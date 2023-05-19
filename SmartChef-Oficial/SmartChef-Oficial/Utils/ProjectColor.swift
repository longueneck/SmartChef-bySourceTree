import Foundation
import UIKit

class ProjectColor{
    
    enum global{
        
        static var yellowBase = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        
        static var yellowLight = UIColor(red: 255/255, green: 230/255, blue: 181/255, alpha: 1)
        
        static var brownBase = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
    }
    
    enum globalCGColor{
        
        static var yellowBase = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1).cgColor
        
        static var yellowLight = UIColor(red: 255/255, green: 230/255, blue: 181/255, alpha: 1).cgColor
        
        static var brownBase = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1).cgColor
        
    }
}
