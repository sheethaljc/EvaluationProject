//
//  Extensions.swift
//  InterviewPOC
//
//  Created by sheethal.chalissery on 29/10/24.
//

import UIKit

@IBDesignable
class RoundedCornerView: UIView {
    
    // if cornerRadius variable is set/changed, change the corner radius of the UIView
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
}

extension UIViewController {

    func pushToVC<T>(toStoryboard: String, toVC: T.Type, _ completion: ((_ _vc: UIViewController?)->Void)? = nil) {
                
        guard let nextViewController = (UIStoryboard(name: toStoryboard, bundle: nil).instantiateViewController(withIdentifier: String(describing: toVC.self)) as? T) else {
            return
        }
        completion?(nextViewController as? UIViewController)
        self.navigationController?.pushViewController(nextViewController as! UIViewController, animated: true)
    }
}
