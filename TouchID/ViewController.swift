//
//  ViewController.swift
//  TouchID
//
//  Created by Kim Nghĩa on 29/09/2022.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func loginWithFTidTapped(_ sender: Any) {
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason  = "Please autherize"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController")
                        self.present(vc!, animated: true, completion: nil)
                    }
                }
            }
        } else {
            let alert = UIAlertController(title: "Unavailable", message: "You cant use this future", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
}

