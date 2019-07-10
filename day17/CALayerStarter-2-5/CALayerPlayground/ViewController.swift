import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var viewForLayer: UIView!
  
//  var layer: CALayer {
//    return viewForLayer.layer
//  }
  
//  var scrollingViewLayer: CAScrollLayer {
//    return view.layer as! CAScrollLayer
//  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    setUpLayer()
//    scrollingViewLayer.scrollMode = kCAScrollBoth

  }
  
  func setUpLayer() {
//    layer.shouldRasterize = true
//    layer.backgroundColor = UIColor.blue.cgColor
//    layer.borderWidth = 100.0
//    layer.borderColor = UIColor.red.cgColor
//
//    layer.shadowOpacity = 0.7
//    layer.shadowRadius = 10.0
//
//    layer.contents = UIImage(named: "star")?.cgImage
//    layer.contentsGravity = kCAGravityCenter
//    layer.magnificationFilter = kCAFilterLinear
//
//    layer.backgroundColor = UIColor(red: 11/255.0, green: 86/255.0, blue: 14/255.0, alpha: 1.0).cgColor
//    layer.opacity = 1.0
//    layer.isHidden = false
//    layer.masksToBounds = false
//
//    layer.cornerRadius = 150.0
//    layer.borderWidth = 12.0
//    layer.borderColor = UIColor.white.cgColor
//
//    layer.shadowOpacity = 0.75
//    layer.shadowOffset = CGSize(width: 0, height: 3)
//    layer.shadowRadius = 3.0
//    someView.layer.addSublayer(layer)
    
  }
  
  @IBAction func tapGestureRecognized(_ sender: Any) {
//    layer.shadowOpacity = layer.shadowOpacity == 0.7 ? 0.0 : 0.7
//    if (layer.isGeometryFlipped == false) {
//      layer.isGeometryFlipped = true
//    }
//    else {
//      layer.isGeometryFlipped = false
//    }
  }
  
  @IBAction func pinchGestureRecognized(_ sender: UIPinchGestureRecognizer) {
//    let offset: CGFloat = sender.scale < 1 ? 5.0 : -5.0
//    let oldFrame = layer.frame
//    let oldOrigin = oldFrame.origin
//    let newOrigin = CGPoint(x: oldOrigin.x + offset, y: oldOrigin.y + offset)
//    let newSize = CGSize(width: oldFrame.width + (offset * -2.0), height: oldFrame.height + (offset * -2.0))
//    let newFrame = CGRect(origin: newOrigin, size: newSize)
//    if newFrame.width >= 100.0 && newFrame.width <= 300.0 {
//      layer.borderWidth -= offset
//      layer.cornerRadius += (offset / 2.0)
//      layer.frame = newFrame
//    }
  }
  
}
