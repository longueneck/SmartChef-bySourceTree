import UIKit

 
class WrapperViewAnimation {
    
    let target: UIView
    let duration = 0.3
    
    init(target:UIView) {
        self.target = target
    }
    
    func startANimation(){
        
        let circlePath = UIBezierPath(roundedRect: target.bounds, cornerRadius: 10)
    
        target.layer.cornerRadius = 10
        target.clipsToBounds = true
      
        let gradient = CAGradientLayer()
 
        gradient.frame = target.bounds
   
        gradient.colors = [ UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1).cgColor, UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1).cgColor ]
 
        let shape = CAShapeLayer()
    
        shape.strokeEnd = 0
        shape.lineCap = .round
        shape.lineWidth = 4
        shape.fillColor = UIColor.clear.cgColor

 
        shape.path = circlePath.cgPath
 
        shape.strokeColor = UIColor.black.cgColor
    
        gradient.mask = shape
       
        target.layer.addSublayer(gradient)
    
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = duration
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shape.add(animation, forKey: "urSoBasic")
    }
    
    func reverseAnimation(){
        
        target.layer.removeAllAnimations()
        target.layer.sublayers?.forEach({ l in

                    let type = type(of: l)
                    if type == CAGradientLayer.self {
                        l.removeFromSuperlayer()
                    }
         
                })
    
        let circlePath = UIBezierPath(roundedRect: target.bounds, cornerRadius: 10)
        
        target.layer.cornerRadius = 10
        target.clipsToBounds = true
      
        let gradient = CAGradientLayer()
 
        gradient.frame = target.bounds
   
        gradient.colors = [ UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1).cgColor, UIColor(red: 69/255, green: 48/255, blue: 20/255, alpha: 1).cgColor ]
 
        let shape = CAShapeLayer()
    
        shape.strokeEnd = 1
        shape.lineCap = .round
        shape.lineWidth = 4
        shape.fillColor = UIColor.clear.cgColor

 
        shape.path = circlePath.cgPath
 
        shape.strokeColor = UIColor.black.cgColor
    
        gradient.mask = shape
       
        target.layer.addSublayer(gradient)
    
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 0
        animation.duration = duration
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shape.add(animation, forKey: "urSoBasic")
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    self.target.layer.sublayers?.forEach({ l in

                        let type = type(of: l)
                        if type == CAGradientLayer.self {
                            l.removeFromSuperlayer()
                        }
             
                    })
                }
    }
    
 
}
