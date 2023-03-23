//
//  CreatePinViewController.swift
//  Latihan-2
//
//  Created by MacBook Pro on 21/03/23.
//

import UIKit

class CreatePinViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var pin1TextField: UITextField!
    @IBOutlet weak var pin2TextField: UITextField!
    @IBOutlet weak var pin3TextField: UITextField!
    @IBOutlet weak var pin4TextField: UITextField!
    @IBOutlet weak var pin5TextField: UITextField!
    @IBOutlet weak var pin6TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup() {
        containerView.layer.cornerRadius = 40
        containerView.layer.masksToBounds = true
        containerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        pin1TextField.layer.cornerRadius = 10
        pin1TextField.layer.masksToBounds = true
        pin1TextField.layer.borderWidth = 1
        pin1TextField.layer.borderColor = UIColor.separator.cgColor
        
        pin2TextField.layer.cornerRadius = 10
        pin2TextField.layer.masksToBounds = true
        pin2TextField.layer.borderWidth = 1
        pin2TextField.layer.borderColor = UIColor.separator.cgColor
        
        pin3TextField.layer.cornerRadius = 10
        pin3TextField.layer.masksToBounds = true
        pin3TextField.layer.borderWidth = 1
        pin3TextField.layer.borderColor = UIColor.separator.cgColor
        
        pin4TextField.layer.cornerRadius = 10
        pin4TextField.layer.masksToBounds = true
        pin4TextField.layer.borderWidth = 1
        pin4TextField.layer.borderColor = UIColor.separator.cgColor
        
        pin5TextField.layer.cornerRadius = 10
        pin5TextField.layer.masksToBounds = true
        pin5TextField.layer.borderWidth = 1
        pin5TextField.layer.borderColor = UIColor.separator.cgColor
        
        pin6TextField.layer.cornerRadius = 10
        pin6TextField.layer.masksToBounds = true
        pin6TextField.layer.borderWidth = 1
        pin6TextField.layer.borderColor = UIColor.separator.cgColor
    }

}

extension UIViewController {
    func showCreatePinViewController() {
        let storyboard = UIStoryboard(name: "CreatePin", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CreatePinViewController")
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
