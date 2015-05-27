import UIKit
import Foundation

class MatchesView: UIViewController {
    var xFromCenter:CGFloat = 0
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    
    imageView = UIImageView(frame: CGRectMake(self.view.bounds.width / 2 - 100, self.view.bounds.height / 2 - 50 , 200, 100))
    // default image for user
    imageView.image = UIImage(named: "frame")
    // adding a corner radius to the image
    imageView.layer.cornerRadius = imageView.frame.size.width / 2
    imageView.clipsToBounds = true
        self.view.addSubview(imageView)
        
        var gesture = UIPanGestureRecognizer(target: self, action: Selector("wasDragged"))
        imageView.addGestureRecognizer(gesture)
        imageView.userInteractionEnabled = true
        
    }
    
    func wasDragged(gesture:UIPanGestureRecognizer){
      let translation = gesture.translationInView(self.view)
        // get what has been dragged
        var profile = gesture.view!
        xFromCenter += translation.x
        var scale = min(100 / abs(xFromCenter),1)
        profile.center = CGPoint(x: profile.center.x + translation.x, y: profile.center.y + translation.y)
        
        // resetting the translation
        
        gesture.setTranslation(CGPointZero, inView: self.view)
        // rotates the image
        var rotation:CGAffineTransform = CGAffineTransformMakeRotation(translation.x / 200)
        // stretch the current view
        var stretch:CGAffineTransform = CGAffineTransformScale(rotation, scale, scale)
        // if someone is chosen or not
        if profile.center.x < 100{
            println("not chosen")
            
        } else {
            println("chosen")
    }
    
    
        if gesture.state == UIGestureRecognizerState.Ended {
            // set the image back
            profile.center = CGPointMake(view.bounds.width / 2, view.bounds.height / 2)
            //undo Scale
            scale = max(abs(xFromCenter) / 100, 1)
            // undo rotations
            rotation = CGAffineTransformMakeRotation(0)
            imageView.frame = (frame :CGRectMake(self.view.bounds.width / 2 - 100, self.view.bounds.height / 2 - 50, 200, 100))
            
            
        }
    
    }
    
    
    
    
    
    
}