import Foundation
import UIKit

extension UIColor {
    static func gradientColor(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) -> UIColor? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.bounds = CGRect(origin: .zero, size: UIScreen.main.bounds.size)
        
        UIGraphicsBeginImageContextWithOptions(gradientLayer.bounds.size, true, 0)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return UIColor(patternImage: gradientImage ?? UIImage())
        }
        
        return nil
    }
}

class Color {
    
    
    
    
    enum Global{
        
        static var yellowBase = UIColor(red: 255/255, green: 177/255, blue: 0/255, alpha: 1)
        
//        static var yellowBaseGradient: UIColor? {
//                    return UIColor.gradientColor(colors: [yellowBase, darkYellow], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1))
//                }
        static var darkYellow = UIColor(red: 255/255, green: 116/255, blue: 49/255, alpha: 1)
        
        static var lightYellow = UIColor(red: 255/255, green: 230/255, blue: 181/255, alpha: 1)
        
        static var brownBase = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1)
        
        static var white = UIColor.white
        
    }
    
    enum GlobalCGColor{
        
        static var yellowBaseCG = UIColor(red: 255/255, green: 171/255, blue: 0/255, alpha: 1).cgColor
        
        static var lightYellowCG = UIColor(red: 255/255, green: 230/255, blue: 181/255, alpha: 1).cgColor
        
        static var brownBaseCG = UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1).cgColor
        
        static var whiteCG = UIColor.white.cgColor
        
    }
    
}
